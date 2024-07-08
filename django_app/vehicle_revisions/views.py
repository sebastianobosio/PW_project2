from django.shortcuts import render
from django.http import JsonResponse
from .models import Vehicle


# Create your views here.
def index(request):
    return render(request, 'index.html')


def vehicle_search(request):
    if request.method == 'GET' and request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        number = request.GET.get('telaio', '')
        model = request.GET.get('modello', '')
        brand = request.GET.get('marca', '')
        prod_date = request.GET.get('dataProd', '')

        vehicles = Vehicle.objects.all()

        if number:
            vehicles = vehicles.filter(number__icontains=number)
        if model:
            vehicles = vehicles.filter(model__icontains=model)
        if brand:
            vehicles = vehicles.filter(brand__icontains=brand)
        if prod_date:
            vehicles = vehicles.filter(prod_date=prod_date)

        vehicle_data = list(vehicles.values())
        vehicle_data_sorted = sorted(vehicle_data, key=lambda x: x['prod_date'], reverse=True)

        return JsonResponse({'success': True, 'data': vehicle_data_sorted})

    
    # Not sure if this is necessary. It seems a repetition
    # # Handle initial page load or non-AJAX request
    vehicles = Vehicle.objects.all().values()
    vehicle_data = list(vehicles)

    if request.headers.get('X-Requested-With') == 'XMLHttpRequest':
        return JsonResponse({'success': True, 'data': vehicle_data})
    else:
        print(request.headers)
        return render(request, 'vehicle-search.html', {'vehicle_data': vehicle_data})

