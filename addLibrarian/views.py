import psycopg2
from django.shortcuts import render

# Create your views here.

from django.shortcuts import redirect
from django.http import HttpResponse
from django.template import loader

from library.commonFunctions import addRolesToContext, isUserLoggedIn, getSessionUser

def addNewLibrarian(request):
    if not isUserLoggedIn(request): return redirect('/')
    context = {}
    addRolesToContext(request, context)
    if context['sessionUser'] != 'admin': return redirect('/index/')
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()

    cursor.execute("""select login from uzytkownik
full outer join bibliotekarz using(login)
where bibliotekarz_id is null;""")
    logins = cursor.fetchall()
    context['logins'] = logins

    cursor.execute("select adres_id from adres")
    adres_ids = cursor.fetchall()
    context['adresy'] = adres_ids
    if request.method == 'POST':
        requestData = request.POST
        imie = requestData['fname']
        nazwisko = requestData['lname']
        email = requestData['email']
        telefon = requestData['telefon']
        login = requestData['login']
        adres_id = requestData['adres_id']

        cursor.execute(
            """prepare plan(text, text, text, text, text, int) as 
            insert into bibliotekarz 
        (imie, nazwisko, email, telefon, login, adres_id) values 
        ($1, $2, $3, $4, $5, $6);""")

        cursor.execute(f"""execute plan ('{imie}', '{nazwisko}', '{email}', '{telefon}', '{login}', '{adres_id}');""")
        conn.commit()
        context['message'] = "pomyslnie dodano bibliotekarza!"

    conn.close()
    template = loader.get_template('addLibrarian/addLibrarian.html')
    return HttpResponse(template.render(context, request))

def addNewReader(request):
    if not isUserLoggedIn(request): return redirect('/index/')
    context = {}
    addRolesToContext(request, context)
    if not context['isLibrarian'] and not context['isAdmin']: return redirect('/index/')
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute("""select login from uzytkownik
full outer join czytelnik using(login)
where czytelnik_id is null;""")
    logins = cursor.fetchall()
    context['logins'] = logins

    cursor.execute("select adres_id from adres")
    adres_ids = cursor.fetchall()
    context['adresy'] = adres_ids
    if request.method == 'POST':
        requestData = request.POST
        imie = requestData['fname']
        nazwisko = requestData['lname']
        email = requestData['email']
        telefon = requestData['telefon']
        login = requestData['login']
        adres_id = requestData['adres_id']
        cursor.execute("""prepare checkIfReaderExist(text) as
        select login from czytelnik  where login = $1;
        """)
        cursor.execute(f"""execute checkIfReaderExist('{login}');""")
        if cursor.fetchall() != []:
            context['message'] = "probowano dodaj czytelnika, ktory juz instnieje"
        else:
            cursor.execute("""prepare addReader(text, text, text, text, text, int) as
                insert into czytelnik (imie, nazwisko, email, telefon, login, adres_id) values
                ($1, $2, $3, $4, $5, $6);"""
            )
            cursor.execute(f"""execute addReader('{imie}', '{nazwisko}', '{email}', '{telefon}', '{login}', {adres_id});""")
            conn.commit()
            context['message'] = "pomyslnie dodano czytelnika!"

    conn.close()
    template = loader.get_template('addLibrarian/addReader.html')
    return HttpResponse(template.render(context, request))

