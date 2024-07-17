from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('vehicle-search/', views.vehicle_search, name='vehicle_search'),
    path('plate-search/', views.plate_search, name='plate_search'),
    path('revision-search/', views.revision_search, name='revision_search'),

    path('edit-revision/<int:id>/', views.edit_revision, name='edit_revision'),
    path('delete-revision/<int:id>/', views.delete_revision, name='delete_revision'),
    path('create-revision/', views.create_revision, name='create_revision'),

    path('vehicle-details/<int:id>/', views.vehicle_details, name='vehicle_details'),
    path('plate-details/<str:id>/', views.plate_details, name='plate_details'),
    path('revision-details/<int:id>/', views.revision_details, name='revision_details'),
]
