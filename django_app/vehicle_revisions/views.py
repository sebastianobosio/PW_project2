from django.shortcuts import render
from django.http import JsonResponse
from .models import Vehicle, Plate, Activeplate, Inactiveplate


# Create your views here.
def index(request):
    return render(request, 'index.html')


def vehicle_search(request):
    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        number = request.GET.get('telaio', '')
        model = request.GET.get('modello', '')
        brand = request.GET.get('marca', '')
        prod_date = request.GET.get('dataProd', '')

        vehicles_data = Vehicle.objects.all()

        if number:
            vehicles_data = vehicles_data.filter(number__icontains=number)
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


def plate_search(request):
    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        number = request.GET.get('targa', '')
        vehicle_number = request.GET.get('telaio', '')
        emission_date = request.GET.get('dataEm', '')
        res_date = request.GET.get('dataRes', '')
        status = request.GET.get('status', '')

        def filter_data(queryset):
            if number:
                queryset = queryset.filter(number__icontains=number)
            if vehicle_number:
                queryset = queryset.filter(
                    vehiclenumber__icontains=vehicle_number)
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

        print(plates_data)
        plates_data_sorted = sorted(
            plates_data, key=lambda x: x['emission_date'], reverse=True)

        return JsonResponse({'success': True, 'data': plates_data_sorted})

    # If the request is not ajax it return the template. In the template there is a js file (veicolo.js)
    # that on load make an ajax request simulating an empty form search to fetch all the vehicles.
    # This way i don't have to pass also the context and maybe using Django template to render the data,
    # but i can reuse the rendering function that i've built for the previous project (now with Bootstrap)
    return render(request, 'plate-search.html')


def revision_search(request):
    return render(request, 'revision-search.html')