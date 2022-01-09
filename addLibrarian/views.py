import psycopg2
from django.shortcuts import render

# Create your views here.

from django.shortcuts import redirect
from django.http import HttpResponse
from django.template import loader

from library.commonFunctions import addAdminContextFromSessionUser, addLibrarianContext, addAdminContext, addLibrarianContextFromSessionUser

def addNewLibrarian(request):
    if not isUserLoggedIn(request): return redirect('/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
    if sessionUser != 'admin':
        return redirect('/index/')
    addAdminContextFromSessionUser(sessionUser, context)
    # form = NameForm()
    # context['form'] = form
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
        sqlQuery = f"""
        insert into bibliotekarz 
        (imie, nazwisko, email, telefon, login, adres_id) values 
        ('{imie}', '{nazwisko}', '{email}', '{telefon}', '{login}', {adres_id} );
        """
        print(sqlQuery)
        cursor.execute(sqlQuery)
        conn.commit()
        context['message'] = "pomyslnie dodano bibliotekarza!"

    conn.close()
    template = loader.get_template('addLibrarian/addLibrarian.html')
    return HttpResponse(template.render(context, request))

def isUserLibrarian(sessionUser):
    conn = psycopg2.connect(
        host="localhost",
        database="biblioteka",
        user="postgres",
        password="=xBF[q:WN'9.!he(>")
    cursor = conn.cursor()
    cursor.execute(f"""select login from bibliotekarz 
join uzytkownik using(login) 
where login = '{sessionUser}';""")
    results = cursor.fetchall()
    # print(results)
    conn.close()



def addNewReader(request):
    if not isUserLoggedIn(request): return redirect('/index/')
    sessionUser = request.session['user_login']
    context = {'sessionUser': sessionUser}
    if not isUserLibrarian(sessionUser) and sessionUser != 'admin': return redirect('/index/')
    # context = {'sessionUser': sessionUser}
    if sessionUser != 'admin':
        return redirect('/index/')
    context['isAdmin'] = True
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
        sqlQuery = f"""
                insert into czytelnik 
                (imie, nazwisko, email, telefon, login, adres_id) values 
                ('{imie}', '{nazwisko}', '{email}', '{telefon}', '{login}', {adres_id} );
                """
        print(sqlQuery)
        cursor.execute(sqlQuery)
        conn.commit()
        context['message'] = "pomyslnie dodano czytelnika!"

    conn.close()
    template = loader.get_template('addLibrarian/addReader.html')
    return HttpResponse(template.render(context, request))

