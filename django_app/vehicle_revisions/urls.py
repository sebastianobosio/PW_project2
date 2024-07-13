from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('vehicle-search/', views.vehicle_search, name='vehicle_search'),
    path('plate-search/', views.plate_search, name='plate_search'),
    path('revision-search/', views.revision_search, name='revision_search'),
    path('edit-revision/<int:id>', views.edit_revision, name='edit_search'),
]
