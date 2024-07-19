# PW_project2
Second project for Programmazione Web. Recreation of the first project using Django, Bootstrap and JQuery.

# Come installare l'applicazione in locale 
## Dipendeze python
Per gestire le dipendende del progetto ho scelto di usare *Poetry*, che permette di tener traccia delle dipendenze
necessarie al progetto, insieme alla loro versione, per poter velocemente trasferire il progetto su una nuova macchina.
Tuttavia le dipendenze necessarie sono solo due: *psycopg2* e *django*.
Per installare usare ```python -m pip install django psycopg2``` anche se probabilmente saranno già installate

## Creazione e connessione database
Per creare il database bisogna creare prima il database usando PgAdmin con nome *sebastianobosiopsql*.
Poi eseguire il comando da linea di comando ```pg_dump -h 127.0.0.1 -p 5432 sebastianobosiopsql < vehicle_database.sql```
Il file *vehicle_database.sql* è il file generato dallo script python. Nel comando precendente bisogna inserire tutto il percorso di questo file.
Il file si trova sotto alla cartella *db* del mio progetto.
In questo modo il database viene riempito con il dump file.
Ora bisogna andare sotto a *PW_project2/django_app/django_app* ed aprire il file *settings.py*
Una volta aperto recarsi alla sezione *DATABASE* e modifare *USER* e *PASSWORD*
con le proprie con le quali avete creato il database.

## Eseguire l'applicazione
Per eseguire l'applicazione recarsi in *PW_project2/django_app/* ed eseguire il comando
```python manage.py runserver```
Poi andare al *127.0.0.1:8000/vehicle-revisions* con un browser qualsiasi.
