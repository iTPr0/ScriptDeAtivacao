@echo off
chcp 65001 >nul
title iDWeb - Soluções™

:: Detecta se o script foi executado como administrador
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

if %errorlevel% neq 0 (
    echo Solicitando privilégios de administrador...
    goto UACPrompt
) else (
    goto :CheckWindowsVersion
)

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:CheckWindowsVersion
:: Verifica se a versão é Windows 10 ou 11
systeminfo | findstr /i "Versão do sistema"
if %errorlevel% equ 0 (
    echo Windows 10 detectado. Show! Executando...
    goto :menu
)

systeminfo | findstr /i "Versão do SO"
if %errorlevel% equ 0 (
    echo Windows 11 detectado. Show! Executando...
    goto :menu
)

:: Se não é Windows 10 ou 11, exibe mensagem de erro
echo Poxa! Desculpe, a versão do Windows não suportada. Este script requer Windows 10 ou 11 posterior.
echo Saindo...
timeout /nobreak /t 5 >nul
exit /B

:menu
cls
mode con: cols=80 lines=20

echo.
echo.
echo.
echo.
echo ██ ██████  ██     ██ ███████ ██████  
echo ██ ██   ██ ██     ██ ██      ██   ██ 
echo ██ ██   ██ ██  █  ██ █████   ██████  
echo ██ ██   ██ ██ ███ ██ ██      ██   ██ 
echo ██ ██████   ███ ███  ███████ ██████  
echo.                                     
echo.                                    
echo ===============================
echo        MENU PRINCIPAL
echo ===============================
echo 1. Ativar o Windows
echo 2. Abrir link do desenvolvedor
echo 3. Sair
echo ===============================

set /p opcao=Escolha uma opção: 

if "%opcao%"=="1" goto :runActivation
if "%opcao%"=="2" goto :openDeveloperLink
if "%opcao%"=="3" goto :exitScript

:runActivation
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato

echo.
echo --- Ativação Concluída! ---
echo.
pause
goto :menu

:openDeveloperLink
start "" "https://links.tifodao.com"
goto :menu

:exitScript
echo Saindo...
timeout /nobreak /t 3 >nul
exit /B