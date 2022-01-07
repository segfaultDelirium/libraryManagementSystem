from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm

import psycopg2

# Create your views here.
def register(request):
    try:
        print(request.session)
        sessionLogin = request.session['user-login']
        print(sessionLogin)
    except:
        print('there is no request.session[user_login]')

    # print(request.session)
    # print(request.session['user_login'])
    form = UserCreationForm()
    context = {'form': form}
    if request.method == 'POST':
        requestData = request.POST
        print(requestData)
        username = requestData.get('username')
        password1 = requestData.get('password1')
        password2 = requestData.get('password2')
        print(username)
        print(password1)
        print(password2)
        isValid: bool = True
        errorMessages: [str] = []
        if password1 != password2:
            print('passwords do not match!')
            errorMessages.append('passwords do not match!')
            isValid = False
        if len(password1) < 8:
            print('password is too short!')
            errorMessages.append('password is too short!')
            isValid = False
        if password1.isdecimal():
            print('password cannot be only digits')
            errorMessages.append('password cannot be only digits')
            isValid = False
        if not isValid:
            return render(request, "register/register.html", context)

        conn = psycopg2.connect(
            host="localhost",
            database="biblioteka",
            user="postgres",
            password="=xBF[q:WN'9.!he(>")
        cursor = conn.cursor()
        #  check if user already exists in the database
        cursor.execute(f'select * from public.uzytkownik where login = \'{username}\'');
        result = cursor.fetchall()
        print(result)
        if len(result) != 0:
            print('someone with this username is already registered!')
            errorMessages.append('someone with this username is already registered!')
            conn.close()
            context = {'form': form, 'errorMessages': errorMessages}
            template = loader.get_template('login/login.html')
            return HttpResponse(template.render(context, request))
        # print(f'insert into public.uzytkownik (login, haslo) values (\'{username}\', \'{password1}\')')
        # cursor.execute(f'insert into public.uzytkownik (login, haslo) values (\'{username}\', \'{password1}\')')
        cursor.execute(f'insert into public.uzytkownik (login, haslo) values (\'testuser2\', \'testuser2\');')
        conn.commit()
        # result = cursor.fetchall()
        # print('result of insert: ')
        # print(result)
        conn.close()
        request.session['user_login'] = username
        errorMessages.append('successful registration!')
        return render(request, "register/register.html", context)

    # else:
    #     form = UserCreationForm()
    return render(request, "register/register.html", context)