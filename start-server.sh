#!/bin/bash
# Script para iniciar el servidor de Middleman con la configuración correcta
# Uso: ./start-server.sh

echo "Iniciando servidor de Middleman..."
echo "El servidor estará disponible en: http://localhost:4567"
echo "El panel de administración estará en: http://localhost:4567/admin"
echo ""
echo "Presiona Ctrl+C para detener el servidor"
echo ""

RUBYOPT="-Eutf-8:utf-8" bundle exec middleman server
