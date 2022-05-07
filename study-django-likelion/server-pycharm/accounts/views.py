from django.shortcuts import render, redirect
from django.contrib import auth
from django.contrib.auth.models import User
from django.http import HttpResponse
from .forms import UserForm, LoginForm

def signup(request):
    if request.method == 'POST':
        form = UserForm(request.POST)
        if form.is_valid():
            user = User.objects.create_user(**form.cleaned_data)
            auth.login(request, user)
            return redirect('index')
    else:
        form = UserForm()
    return render(request, 'signup.html', {'form':form})

def login(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        username = request.POST['username']
        password = request.POST['password']
        user = auth.authenticate(username=username, password=password)
        if user is not None:
            auth.login(request, user)
            return redirect('index')
        else:
            return HttpResponse('로그인 실패. 다시 시도 해보세요.')
    else:
        form = LoginForm()
        return render(request, 'registration/login.html', {'form': form})

# def login(request):
#     if request.method == 'POST':
#         username = request.POST['username']
#         password = request.POST['password']
#         user = auth.authenticate(request, username=username, password=password)
#         if user is not None:
#             auth.login(request, user)
#             return redirect('index')
#         else:
#             return render(request, 'registration/login.html', {'error': 'username or password is incorrect.'})
#     else:
#         return render(request, 'registration/login.html')

def logout(request):
    if request.method == 'POST':
        auth.logout(request)
        return redirect('index')
    return render(request, 'registration/signup.html')
