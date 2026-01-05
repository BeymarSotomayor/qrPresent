#!/bin/bash

# Script para ejecutar el servidor Django

echo "=== Iniciando servidor Django ==="

# 1. Verificar y activar entorno virtual
echo "1. Activando entorno virtual..."
if [ -d "venv" ]; then
    source venv/bin/activate
    if [ $? -ne 0 ]; then
        echo "❌ Error al activar el entorno virtual"
        exit 1
    fi
    echo "✓ Entorno virtual activado"
else
    echo "❌ No se encontró el directorio 'venv'"
    echo "   Ejecuta primero: python3 -m venv venv"
    exit 1
fi

# 2. Verificar que existe manage.py
echo "2. Verificando archivo manage.py..."
if [ ! -f "manage.py" ]; then
    echo "❌ No se encontró el archivo 'manage.py'"
    echo "   Asegúrate de estar en el directorio correcto del proyecto"
    deactivate 2>/dev/null
    exit 1
fi
echo "✓ Archivo manage.py encontrado"

# 3. Ejecutar migraciones (opcional, comentado por defecto)
# echo "3. Aplicando migraciones..."
# python3 manage.py migrate
# if [ $? -ne 0 ]; then
#     echo "⚠  Advertencia: Hubo un error al aplicar migraciones"
#     echo "   Continuando de todas formas..."
# fi

# 4. Ejecutar servidor
echo "=== Iniciando servidor en 0.0.0.0:8000 ==="
echo "=== El servidor estará disponible en: ==="
echo "===   - http://localhost:8000        ==="
echo "===   - http://127.0.0.1:8000        ==="
echo "===   - IP local de tu red:8000      ==="
echo ""
echo "Presiona Ctrl+C para detener el servidor"
echo ""

python3 manage.py runserver 0.0.0.0:8000

# 5. Desactivar entorno virtual al salir
echo ""
echo "Desactivando entorno virtual..."
deactivate 2>/dev/null
echo "✓ Script finalizado"