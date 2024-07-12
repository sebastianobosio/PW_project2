from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('vehicle-search/', views.vehicle_search, name='vehicle_search'),
    path('plate-search/', views.plate_search, name='plate_search'),
]
