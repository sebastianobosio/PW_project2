# Generated by Django 5.0.6 on 2024-06-25 15:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('vehicle_revisions', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Activeplates',
            new_name='Activeplate',
        ),
        migrations.RenameModel(
            old_name='Inactiveplates',
            new_name='Inactiveplate',
        ),
        migrations.RenameModel(
            old_name='Plates',
            new_name='Plate',
        ),
        migrations.RenameModel(
            old_name='Revisions',
            new_name='Revision',
        ),
    ]
