# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Vehicle(models.Model):
    number = models.CharField(primary_key=True, max_length=7)
    model = models.CharField(max_length=20, blank=True, null=True)
    brand = models.CharField(max_length=20, blank=True, null=True)
    prod_date = models.DateField(blank=True, db_column='proddate', null=True)

    class Meta:
        db_table = 'vehicle'


class Activeplate(models.Model):
    number = models.CharField(primary_key=True, max_length=7)
    emission_date = models.DateField(blank=True, db_column='emissiondate', null=True)
    vehicle_number = models.ForeignKey(
        Vehicle, models.DO_NOTHING, db_column='vehiclenumber', blank=True, null=True)

    class Meta:
        db_table = 'activeplates'


class Inactiveplate(models.Model):
    number = models.CharField(primary_key=True, max_length=7)
    emission_date = models.DateField(blank=True, db_column='emissiondate', null=True)
    vehicle_number = models.ForeignKey(
        Vehicle, models.DO_NOTHING, db_column='vehiclenumber', blank=True, null=True)
    res_date = models.DateField(blank=True, db_column='resdate', null=True)

    class Meta:
        db_table = 'inactiveplates'


class Plate(models.Model):
    number = models.CharField(primary_key=True, max_length=7)
    emission_date = models.DateField(blank=True, db_column='emissiondate', null=True)
    vehicle_number = models.ForeignKey(
        Vehicle, models.DO_NOTHING, db_column='vehiclenumber', blank=True, null=True)
    active = models.BooleanField(blank=True, null=True)

    class Meta:
        db_table = 'plates'


class Revision(models.Model):
    plate_number = models.ForeignKey(
        Plate, models.DO_NOTHING, db_column='platenumber', blank=True, null=True)
    revision_date = models.DateField(blank=True, db_column='revisiondate', null=True)
    outcome = models.CharField(max_length=10, blank=True, null=True)
    motivation = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'revisions'
