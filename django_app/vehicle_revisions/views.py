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
        vehicles_data_sorted = sorted(vehicles_data, key=lambda x: x['prod_date'], reverse=True)

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

        plates_data = []
        if status == 'active':
            plates_data = Activeplate.objects.all()
            if number:
                plates_data = plates_data.filter(number__icontains=number)
            if vehicle_number:
                plates_data = plates_data.filter(vehiclenumber__icontains=vehicle_number)
            if emission_date:
                plates_data = plates_data.filter(emission_date=emission_date)
        elif status == 'returned' or res_date:
            plates_data = Inactiveplate.objects.all()
            if number:
                plates_data = plates_data.filter(number__icontains=number)
            if vehicle_number:
                plates_data = plates_data.filter(vehiclenumber__icontains=vehicle_number)
            if emission_date:
                plates_data = plates_data.filter(emission_date=emission_date)
            if res_date:
                plates_data = plates_data.filter(resdate=res_date)
        else:
            active_plates_data = Activeplate.objects.all()
            if number:
                active_plates_data = active_plates_data.filter(number__icontains=number)
            if vehicle_number:
                active_plates_data = active_plates_data.filter(vehicle_number__icontains=vehicle_number)
            if emission_date:
                active_plates_data = active_plates_data.filter(emission_date=emission_date)

            inactive_plates_data = Inactiveplate.objects.all()
            if number:
                inactive_plates_data = inactive_plates_data.filter(number__icontains=number)
            if vehicle_number:
                inactive_plates_data = inactive_plates_data.filter(vehicle_number__icontains=vehicle_number)
            if emission_date:
                inactive_plates_data = inactive_plates_data.filter(emission_date=emission_date)

            plates_data = list(inactive_plates_data.values())

        print(plates_data)
        plates_data = list(plates_data.values()) # this give an error cause i've already made a list two line above. To resolve
        plates_data_sorted = sorted(plates_data, key=lambda x: x['emission_date'], reverse=True)

        return JsonResponse({'success': True, 'data': plates_data_sorted})

    # If the request is not ajax it return the template. In the template there is a js file (veicolo.js)
    # that on load make an ajax request simulating an empty form search to fetch all the vehicles.
    # This way i don't have to pass also the context and maybe using Django template to render the data, 
    # but i can reuse the rendering function that i've built for the previous project (now with Bootstrap)
    return render(request, 'plate-search.html')

