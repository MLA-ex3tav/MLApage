# Script de despliegue para GitHub Pages
# Este script inicializa git e intenta subir los archivos a tu repositorio.

# Configuración del Repositorio (CAMBIAR ESTO)
$REPO_URL = "https://github.com/MLA-ex3tav/MLAapp.git" # Tu URL de GitHub aquí

# Verificar si Git está instalado
if (!(Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "Error: Git no está instalado. Por favor instala Git desde https://git-scm.com/" -ForegroundColor Red
    exit
}

# Inicializar Git si no existe
if (!(Test-Path ".git")) {
    Write-Host "Inicializando repositorio Git..." -ForegroundColor Blue
    git init
}

# Añadir archivos (respeta el .gitignore que creamos antes)
Write-Host "Añadiendo archivos..." -ForegroundColor Blue
git add .

# Primer Commit
Write-Host "Realizando commit..." -ForegroundColor Blue
git commit -m "Despliegue de MLA Page / Actualización de configuración"

# Configurar Rama Main
Write-Host "Configurando rama principal..." -ForegroundColor Blue
git branch -M main

# Añadir remoto si no existe
if (!(git remote show origin -ErrorAction SilentlyContinue)) {
    Write-Host "Añadiendo remoto origin: $REPO_URL" -ForegroundColor Blue
    git remote add origin $REPO_URL
}

# Subir a GitHub
Write-Host "Subiendo a GitHub (Pages se activará automáticamente)..." -ForegroundColor Green
git push -u origin main --force

Write-Host "`n¡Despliegue completado! Si este es un repositorio nuevo, ve a Settings > Pages en GitHub y selecciona la rama 'main' como fuente." -ForegroundColor Cyan
