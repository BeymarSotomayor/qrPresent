from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib import messages
from .forms import *

from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import Asistencia
import json


def login_view(request):
    # Si el usuario ya está autenticado, redirigir al dashboard
    if request.user.is_authenticated:
        return redirect('dashboard')
    
    if request.method == 'POST':
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            
            # Buscar usuario por email (puede haber múltiples)
            users = User.objects.filter(email=email)
            
            if users.exists():
                # Intentar autenticar con cada usuario que tenga ese email
                authenticated_user = None
                for user in users:
                    user_check = authenticate(request, username=user.username, password=password)
                    if user_check is not None:
                        authenticated_user = user_check
                        break
                
                if authenticated_user is not None:
                    login(request, authenticated_user)
                    messages.success(request, '¡Inicio de sesión exitoso!')
                    return redirect('dashboard')
                else:
                    messages.error(request, 'Contraseña incorrecta')
            else:
                messages.error(request, 'No existe un usuario con este correo')
    else:
        form = LoginForm()
    
    
    return render(request, 'admin/login.html', {'form': form})

def logout_view(request):
    logout(request)
    messages.success(request, 'Has cerrado sesión correctamente')
    return redirect('login')

def dashboard_view(request):
    if not request.user.is_authenticated:
        return redirect('login')
    
    return render(request, 'admin/dashboard.html')

def scan_view(request):
    if not request.user.is_authenticated:
        return redirect('login')
    
    return render(request, 'admin/scanner.html')