from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
import psycopg2
from django.shortcuts import redirect
# Create your views here.

from library.commonFunctions import isUserLoggedIn, addRolesToContext, getSessionUser

def logout(request):
    context = {}
    try:
        request.session.pop('user_login')
        context['message'] = 'you were successfully logged out'
    except:
        context['message'] = 'you were already logged out'
    template = loader.get_template('login/logout.html')
    return HttpResponse(template.render(context, request))

def loginAsLibrarianOrReader(request):
    if not isUserLoggedIn(request): return redirect('/index/')
    context = {}
    template = loader.get_template('login/loginAsLibrarianOrReader.html')
    return HttpResponse(template.render(context, request))

def loginAsReader(request):
    request.session ["userType"] = '[Czytelnik]'
    return redirect('/')

def loginAsLibrarian(request):
    request.session['userType'] = '[Bibliotekarz]'
    return redirect('/')

def login(request):
    context = {}
    try:
        context['sessionUser'] = getSessionUser(request)
    except:
        pass
    form = AuthenticationForm()
    errorMessages: [str] = []
    if request.method == 'POST':
        requestData = request.POST
        username = requestData.get('username')
        password = requestData.get('password')
        isValid: bool = True
        conn = psycopg2.connect(
            host="localhost",
            database="biblioteka",
            user="postgres",
            password="=xBF[q:WN'9.!he(>")
        cursor = conn.cursor()

#         """PREPARE fooplan (int, text, bool, numeric) AS
#     INSERT INTO foo VALUES($1, $2, $3, $4);
# EXECUTE fooplan(1, 'Hunter Valley', 't', 200.00);"""

        cursor.execute(
            """prepare plan(text) as 
            select * from public.uzytkownik where login = $1;""")
        cursor.execute(f"""execute plan('{username}')""")
        result = cursor.fetchall()
        if len(result) == 0:
            errorMessages.append('could not find user in the database!')
            conn.close()
            context['form'] = form
            context['errorMessages'] = errorMessages
            template = loader.get_template('login/login.html')
            return HttpResponse(template.render(context, request))
        dblogin = result[0][0]
        dbpassword = result[0][1]
        if password == dbpassword:
            print('login successful!')
            request.session['user_login'] = username
            context['sessionUser'] = username
            print(request.session['user_login'])
            return redirect('/')
        else:
            conn.close()
            print('incorrect password')
            errorMessages.append('incorrect password!')
            context['form'] = form
            context['errorMessages'] = errorMessages
            template = loader.get_template('login/login.html')
            return HttpResponse(template.render(context, request))
        conn.close()

    context['form'] = form
    context['errorMessages'] = errorMessages
    template = loader.get_template('login/login.html')
    return HttpResponse(template.render(context, request))