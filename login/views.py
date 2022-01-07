from django.http import HttpResponse
from django.template import loader
from django.shortcuts import render
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm
import psycopg2
# Create your views here.

def login(request):
    try:
        sessionUser = request.session['user_login']
        print('there is a session for user ', sessionUser)
    except:
        print('there is no request.session[user_login]')
    # print(request.session)
    # print(request.session['user_login'])
    form = AuthenticationForm()
    errorMessages: [str] = []
    if request.method == 'POST':
        requestData = request.POST
        # print(requestData)
        username = requestData.get('username')
        password = requestData.get('password')
        # print(username)
        # print(password)
        isValid: bool = True
        # errMessages: [str] = []
        # if not isValid:
        #     return render(request, "register/register.html", context)
        #
        conn = psycopg2.connect(
            host="localhost",
            database="biblioteka",
            user="postgres",
            password="=xBF[q:WN'9.!he(>")
        cursor = conn.cursor()
        # TODO check if user exists in the database
        cursor.execute(f'select * from public.uzytkownik where login = \'{username}\'');
        result = cursor.fetchall()
        print(result)
        if len(result) == 0:
            print('could not find user in the database!')
            errorMessages.append('could not find user in the database!')
            conn.close()
            context = {'form': form, 'errorMessages': errorMessages}
            template = loader.get_template('login/login.html')
            return HttpResponse(template.render(context, request))
        dblogin = result[0][0]
        dbpassword = result[0][1]
        # print(dblogin)
        # print(dbpassword)
        if password == dbpassword:
            print('login successful!')
            request.session['user_login'] = username
            print(request.session['user_login'])
        else:
            conn.close()
            print('incorrect password')
            errorMessages.append('could not find user in the database!')
            context = {'form': form, 'errorMessages': errorMessages}
            template = loader.get_template('login/login.html')
            return HttpResponse(template.render(context, request))
        conn.close()

        # return render(request, "register/register.html", context)

    context = {'form': form, 'errorMessages': errorMessages}
    template = loader.get_template('login/login.html')
    return HttpResponse(template.render(context, request))
    # return render(request, "login/login.html", context)