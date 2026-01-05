#!/bin/bash

# Script para configuración y ejecución de proyecto Django

echo "=== Iniciando configuración del proyecto ==="

# 1. Crear entorno virtual
echo "1. Creando entorno virtual..."
python3 -m venv venv
if [ $? -ne 0 ]; then
    echo "Error al crear el entorno virtual"
    exit 1
fi
echo "✓ Entorno virtual creado"

# 2. Activar entorno virtual
echo "2. Activando entorno virtual..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error al activar el entorno virtual"
    exit 1
fi
echo "✓ Entorno virtual activado"

# 3. Instalar dependencias
echo "3. Instalando dependencias desde requirements.txt..."
if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    if [ $? -ne 0 ]; then
        echo "Error al instalar dependencias"
        exit 1
    fi
    echo "✓ Dependencias instaladas"
else
    echo "⚠  Archivo requirements.txt no encontrado"
    echo "⚠  Continuando sin instalar dependencias"
fi

# 4. Ejecutar servidor de desarrollo
echo "4. Iniciando servidor de desarrollo..."
echo "=== El servidor se iniciará a continuación ==="
echo "=== Presiona Ctrl+C para detener el servidor ==="
echo ""
python3 manage.py runserver