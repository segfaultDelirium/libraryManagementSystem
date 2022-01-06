from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm

import psycopg2

# Create your views here.
def register(request):
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
        errMessages: [str] = []
        if password1 != password2:
            print('passwords do not match!')
            errMessages.append('passwords do not match!')
            isValid = False
        if len(password1) < 8:
            print('password is too short!')
            errMessages.append('password is too short!')
            isValid = False
        if password1.isdecimal():
            print('password cannot be only digits')
            errMessages.append('password cannot be only digits')
            isValid = False
        if not isValid:
            return render(request, "register/register.html", context)

        conn = psycopg2.connect(
            host="localhost",
            database="biblioteka",
            user="postgres",
            password="=xBF[q:WN'9.!he(>")
        cursor = conn.cursor()
        # TODO check if user already exists in the database
        if not isValid:
            errMessages.append('user with this username is already registered!')
            conn.close()
            return render(request, "register/register.html", context)


        conn.close()


        return render(request, "register/register.html", context)


    # else:
    #     form = UserCreationForm()


    return render(request, "register/register.html", context)