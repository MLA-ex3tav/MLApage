@echo off
set REPO_URL=https://github.com/MLA-ex3tav/MLApage.git

if not exist .git (
    echo [INFO] Inicializando repositorio git...
    git init
)

echo [INFO] Añadiendo cambios y excluyendo el .env...
git add .
git commit -m "Deployment to GitHub Pages"

echo [INFO] Configurando rama principal y remoto...
git branch -M main
git remote add origin %REPO_URL% 2>nul

echo [INFO] Subiendo cambios a GitHub...
git push -u origin main --force

echo [SUCCESS] Despliegue completado! Si es la primera vez, ve a GitHub y activa GitHub Pages en Settings.
pause
