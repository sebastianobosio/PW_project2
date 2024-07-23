# PW_project2
Second project for Programmazione Web. Recreation of the first project using Django, Bootstrap and JQuery.

# Come installare l'applicazione in locale 
## Dipendenze python
Per gestire le dipendende del progetto ho scelto di usare *Poetry*, che permette di tener traccia delle dipendenze
necessarie al progetto, insieme alla loro versione, per poter velocemente trasferire il progetto su una nuova macchina.
Tuttavia le dipendenze necessarie sono solo due: *psycopg2* e *django*.
Per installare usare ```python -m pip install django psycopg2``` anche se probabilmente saranno già installate

## Creazione e connessione database
Per creare il database bisogna creare prima il database usando PgAdmin con nome *sebastianobosiopsql*.
Poi eseguire il comando da linea di comando ```pg_dump -h 127.0.0.1 -p 5432 sebastianobosiopsql < vehicle_database.sql```
Il file *vehicle_database.sql* è il file generato dallo script python. Nel comando precendente bisogna inserire tutto il percorso di questo file oppure deve essere lanciato direttamente dalla cartella ```PW_project2/db```.
Il file si trova sotto alla cartella *db* del mio progetto.
In questo modo il database viene riempito con il dump file.
Nel caso il comando non funzionasse si può usare ```psql -U username sebastianobosiopsql < vehicle_database.sql``` sempre lanciato dalla cartella ```PW_project2/db```. 
Oppure ancora il comando ```psql -h 127.0.0.1 -d sebastianobosiopsql -U username -f vehicle_database.sql```
Una volta lanciato questo comando dovrebbero essere stampate nel terminale diverse righe, le prime 5 *CREATE TABLE* e le altre *INSERT 0 1*. 

Infine se nessuno di questi metodi funziona si può fare tramite pgAdmin 4. Nel caso sia installato una volta creato il database sebastianobosiopsql con il vostro username e password fare il tasto destro sul database - Query tools. A questo punto si apre uno schermata dal quale possiamo fare partire delle query SQL. Cliccare sull'icona della cartella (sopra alla scritta Query) e selezionare da qui il file vehicle_database.sql. Nel pannello principale adesso dovrebbero esserci scritte un po' di righe. Cliccare su play e a questo punto il database dovrebbe essere riempito.

Ora bisogna andare sotto a *PW_project2/django_app/django_app* ed aprire il file *settings.py*
Una volta aperto recarsi alla sezione *DATABASE* e modifare *USER* e *PASSWORD*
con le proprie con le quali avete creato il database.

## Eseguire l'applicazione
Per eseguire l'applicazione recarsi in *PW_project2/django_app/* ed eseguire i seguenti comandi
```python manage.py makemigrations```
```python manage.py migrate```
```python manage.py runserver```
Poi andare al *127.0.0.1:8000/vehicle-revisions* con un browser qualsiasi.
