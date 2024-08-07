from django.shortcuts import render
from django.http import JsonResponse
from .models import Vehicle, Plate, Activeplate, Inactiveplate, Revision


# Create your views here.
def index(request):
    return render(request, 'index.html')


# Questa view (o controller) fa due cose: Quando la pagina viene caricata viene renderizzato il relativo template
# A questo punto, una volta caricato, lo script javascript fa una automatica chiamata ajax sempre a questa view simulando una ricerca
# vuota, generale. In questo caso i filtri sono inutili. Invece quando si riempiono i campi del form di ricerca
# i dati vengono filtrati. Il risultato è in formato Jsono e poi renderizzato dal javascript.
# Tutte le view di ricerca funzionano allo stesso modo
def vehicle_search(request):
    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        number = request.GET.get('telaio', '')
        model = request.GET.get('modello', '')
        brand = request.GET.get('marca', '')
        prod_date = request.GET.get('dataProd', '')

        vehicles_data = Vehicle.objects.all()

        if number:
            vehicles_data = vehicles_data.filter(number=number)
        if model:
            vehicles_data = vehicles_data.filter(model__icontains=model)
        if brand:
            vehicles_data = vehicles_data.filter(brand__icontains=brand)
        if prod_date:
            vehicles_data = vehicles_data.filter(prod_date=prod_date)

        vehicles_data = list(vehicles_data.values())
        vehicles_data_sorted = sorted(
            vehicles_data, key=lambda x: x['prod_date'], reverse=True)

        return JsonResponse({'success': True, 'data': vehicles_data_sorted})

    # If the request is not ajax it return the template. In the template there is a js file (veicolo.js)
    # that on load make an ajax request simulating an empty form search to fetch all the vehicles.
    # This way i don't have to pass also the context and maybe using Django template to render the data,
    # but i can reuse the rendering function that i've built for the previous project (now with Bootstrap)
    return render(request, 'vehicle-search.html')


# Questa view invece renderizza il template per la pagina dei dettagli veicolo. Anche in questo caso è il javascript ad occuparsi della visualizzazione dei dati
# Infatti fa delle chiamate ad alcune view per ricevere i dati sul veicolo, sulle targhe avute dal veicolo e su tutte le revisioni associate.
# Tutte le view di dettaglio sono simili.
def vehicle_details(request, id):
    return render(request, 'vehicle-details.html')


def plate_search(request):
    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        number = request.GET.get('targa', '')
        vehicle_number = request.GET.get('telaio', '')
        emission_date = request.GET.get('dataEm', '')
        res_date = request.GET.get('dataRes', '')
        status = request.GET.get('status', '')

        # Per il filtraggio delle targhe la situazione era un po' più complessa per due motivi. 
        # perchè le tabelle ActivePlate e InactivePlate non hanno il campo status, ma è necessario che sia presente
        # nell'output perché utile al frontend (vedi renderTarga.js). Quindi è necessaria la funzione add_status(). 
        # Poi la ricerca avviene su due tabelle separate ActivePlate e InactivePlate, ma quando si vogliono cercare
        # sia targhe attive che non bisogna fare la ricerca prima su una, poi sull'altra ed infine unire i risultati
        def filter_data(queryset):
            if number:
                queryset = queryset.filter(number=number)
            if vehicle_number:
                queryset = queryset.filter(
                    vehicle_number=vehicle_number)
            if emission_date:
                queryset = queryset.filter(emission_date=emission_date)

            return queryset

        def add_status(status, queryset_values):
            for plate in queryset_values:
                plate['status'] = status
                plates_data.append(plate)

        def fetch_plates(status, plate_model):
            queryset = filter_data(plate_model.objects.all())
            if status == 'returned' and res_date:
                queryset = queryset.filter(resdate=res_date)
            plates = queryset.values()
            add_status(status, plates)

        plates_data = []
        if status == 'active':
            fetch_plates(status, Activeplate)
        elif status == 'returned' or res_date:
            fetch_plates(status, Inactiveplate)
        else:
            # fetch active plates
            fetch_plates('active', Activeplate)
            fetch_plates('returned', Inactiveplate)

        # print(plates_data)
        plates_data_sorted = sorted(
            plates_data, key=lambda x: x['emission_date'], reverse=True)
        if len(plates_data_sorted) > 0:
            return JsonResponse({'success': True, 'data': plates_data_sorted})
        else:
            return JsonResponse({'success': False})

    # If the request is not ajax it return the template. In the template there is a js file (veicolo.js)
    # that on load make an ajax request simulating an empty form search to fetch all the vehicles.
    # This way i don't have to pass also the context and maybe using Django template to render the data,
    # but i can reuse the rendering function that i've built for the previous project (now with Bootstrap)
    return render(request, 'plate-search.html')


def plate_details(request, id):
    return render(request, 'plate-details.html')


# Anche per questa view ci sono state alcune complicazioni. Questa view è chiamata per rispondere a due tipi di chiamate
# Per fare il fetch data una targa, oppure un'array di targa (quando si è nella pagina vehicle-details.html il file js dettagliVeicolo.JsonResponse
# prende tutte le targhe avute dal veicolo, le mette in un array e fa una chiamata qui per prendere tutte le revisioni relative
# a tutte le targhe). Quindi bisogogna distinugere i due casi. Nel caso dell'array bisogna svolgere lo stesso procedimento per ogni targa.
def revision_search(request):
    def filter_data(queryset, filters):
        number = filters.get('number')
        plate = filters.get('plate')
        revision_date = filters.get('revision_date')

        if number:
            queryset = queryset.filter(id=number)
        if plate:
            queryset = queryset.filter(plate_number=plate)
        if revision_date:
            queryset = queryset.filter(revision_date=revision_date)
        return queryset

    def fetch_revisions(outcome, revision_model, filters, revisions_data=[]):
        queryset = filter_data(
            revision_model.objects.all().filter(outcome=outcome), filters=filters)
        revisions = queryset.values()
        revisions_data += list(revisions)
        return revisions_data

    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        if request.GET.get('targhe') and request.GET.get('action') == 'read-array':
            # this is runned when fetching the revisions when loading the details-vehicle page
            plates = [plate for plate in request.GET.get('targhe').split(',')]
            revisions_data = []
            print(plates)
            for plate in plates:
                my_filters = {
                    'plate': plate,
                }
                print(my_filters)
                revisions_data = fetch_revisions(
                    'positive', Revision, filters=my_filters)
                revisions_data = fetch_revisions(
                    'negative', Revision, revisions_data=revisions_data, filters=my_filters)
            revisions_data_sorted = sorted(
                revisions_data, key=lambda x: x['revision_date'], reverse=True)

            return JsonResponse({'success': True, 'data': revisions_data_sorted})

        number = request.GET.get('numero', '')
        plate = request.GET.get('targa', '')
        revision_date = request.GET.get('dataRev', '')
        outcome = request.GET.get('esito', '')

        my_filters = {
            'number': number,
            'plate': plate,
            'revision_date': revision_date
        }

        def add_status(status, queryset_values):
            for plate in queryset_values:
                plate['status'] = status
                revisions_data.append(plate)

        revisions_data = []

        if outcome == 'positive':
            revisions_data = fetch_revisions(
                outcome, Revision, filters=my_filters)
        elif outcome == 'negative':
            revisions_data = fetch_revisions(
                outcome, Revision, filters=my_filters)
        else:
            # fetch active plates
            revisions_data = fetch_revisions(
                'positive', Revision, filters=my_filters)
            revisions_data = fetch_revisions(
                'negative', Revision, filters=my_filters, revisions_data=revisions_data)

        # print(revisions_data)
        revisions_data_sorted = sorted(
            revisions_data, key=lambda x: x['revision_date'], reverse=True)

        return JsonResponse({'success': True, 'data': revisions_data_sorted})

    return render(request, 'revision-search.html')


def revision_details(request, id):
    return render(request, 'revision-details.html')

# Qui ci sono le view per le CRUD operazioni. L'edit è fattibile direttamente dalla card revisione, così come il delete. 
# Invece la creazione viene fatta dal form sul lato destro della pagina che è presente nella pagina
# revision-search/, vehicle-details/ e plate-details/ (questa solo se la targa è attiva)
def edit_revision(request, id):
    if request.method == 'POST' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        new_revdate = request.POST.get('editDataRev', None)
        new_plate = request.POST.get('editTarga', None)
        new_outcome = request.POST.get('editEsito', None)
        new_motivation = request.POST.get('editMotivazione', None)

        obj = Revision.objects.get(id=id)
        print(obj.plate_number)
        obj.plate_number = Plate.objects.get(number=new_plate)
        obj.revision_date = new_revdate
        obj.outcome = new_outcome
        obj.motivation = new_motivation
        obj.save()
        new_revision = {'id': obj.id, 'plate': obj.plate_number}
        print(new_revision)

        response = {
            'success': True,
        }
        return JsonResponse(response)
    return JsonResponse({"errors": "not an ajax request"}, status=400)


def create_revision(request):
    if request.method == 'POST' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        new_plate_number = request.POST.get('addTarga', None)
        new_revdate = request.POST.get('addDataRev', None)
        new_outcome = request.POST.get('addEsito', None)
        new_motivation = request.POST.get('addMotivazione', None)

        obj = Revision.objects.create(
            plate_number=Plate.objects.get(number=new_plate_number),
            revision_date=new_revdate,
            outcome=new_outcome,
            motivation=new_motivation,
        )

        new_revision = {'id': obj.id, 'plate_number': obj.plate_number.number,
                        'revision_date': obj.revision_date, 'outcome': obj.outcome, 'motivation': obj.motivation}
        print(new_revision)

        response = {
            'success': True,
            'revision': new_revision
        }
        return JsonResponse(response)
    return JsonResponse({"errors": "not an ajax request"}, status=400)


def delete_revision(request, id):
    if request.method == 'POST' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        obj = Revision.objects.get(id=id)
        obj.delete()
        response = {
            'success': True,
        }
        return JsonResponse(response)
    return JsonResponse({"errors": "not an ajax request"}, status=400)
