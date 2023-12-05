::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCmDJNtkNgI5BygSbQqGLmSzAok47fv+4fyIrlsYUO0tRIvezPmDIekd1lXxd5ok1UZcmd0FDxRWMBuoYW8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF25
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHErSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbCXqZg==
::ZQ05rAF9IAHYFVzEqQIDKwldXBDCOG76J6EV/ulYKElErQ0qXew7d5jIug==
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIVOw9RDBeBLmKqEvU+6fz456qDp14JXew+NZzemrXOMuUS5kz+dIRt1zpbjMIaDbif3dGkLgs76VlLuGCKINTctwqhTEeb60pwGnBgiG7RmCIhYddp1IMm3yX++EjrmqYE0Dj+Hr8LB3BCAqMoPMZA7gOnfEzFm/NaWvP8ar7gDDjJLyVfiWjGiJZ+n8MuUC10QBxVmPlp8jv9QDF22n5CJiCFtO32yRk1c9PtbQfeKt64hjQewa+2hVgKByNbFBAWShmeACTTAwrTxKjZewwjsNesNO5ncWo0SOITCn0GxPgW6Cf0jOqP+WtpgyXEag==
::dhA7uBVwLU+EWFCgw0cySA==
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEwE00JwgUQxfCOGKoA7wI5/u7/e+Up18LVeYwa+8=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFB9dSQONcma/CrogzO3o5P6IsnEcQOspeSwceXeBbuUL7yU=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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