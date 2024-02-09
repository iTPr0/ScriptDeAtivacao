@echo off
chcp 65001 >nul
title iDWeb - Soluções™

if _%1_==_payload_ goto :payload

:getadmin
echo %~nx0: iniciando o script
set vbs=%temp%\getadmin.vbs
echo Set UAC = CreateObject^("Shell.Application"^)                >> "%vbs%"
echo UAC.ShellExecute "%~s0", "payload %~sdp0 %*", "", "runas", 1 >> "%vbs%"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:payload
:: Verifica se o script foi executado como administrador
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% neq 0 (
    echo Erro: Falha ao obter privilégios de administrador.
    echo Saindo...
    timeout /nobreak /t 5 >nul
    exit /B
)

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
echo 1. Ativar o Windows 10 Education
echo 2. Ativar o Windows 10 Pro, LTSC, e outros
echo 3. Instalar Driver Easy (Silencioso)
echo 4. Instalar Driver Easy (Silencioso/Portátil)
echo 5. Abrir link do desenvolvedor
echo 6. Sair
echo ===============================

set /p opcao=Escolha uma opção: 

if "%opcao%"=="1" goto :runActivationEducation
if "%opcao%"=="2" goto :runActivationProLTSC
if "%opcao%"=="3" goto :installDriverEasySilent
if "%opcao%"=="4" goto :installDriverEasyPortableSilent
if "%opcao%"=="5" goto :openDeveloperLink
if "%opcao%"=="6" goto :exitScript

:runActivationEducation
slmgr /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2
slmgr /skms kms8.msguides.com
slmgr /ato

echo.
echo --- Ativação Concluída! ---
echo.
pause
goto :menu

:runActivationProLTSC
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
slmgr /ato

echo.
echo --- Ativação Concluída! ---
echo.
pause
goto :menu

:installDriverEasySilent
echo Baixando o Driver Easy...
bitsadmin /transfer DriverEasyDownload /download /priority normal "https://github.com/iTPr0/FileExplorer/files/13810800/DriverEasy.zip" "%USERPROFILE%\Downloads\DriverEasy.zip"
echo.
echo --- Download concluído! ---
echo.
echo Extraindo o Driver Easy...
powershell -command "Expand-Archive -Path '%USERPROFILE%\Downloads\DriverEasy.zip' -DestinationPath '%USERPROFILE%\Downloads\DriverEasy' -Force"
echo.
echo Instalando o Driver Easy (Silencioso)...
start /min "" "%USERPROFILE%\Downloads\DriverEasy\DriverEasy.exe"
echo.
echo --- Instalação do Driver Easy (Silencioso) Concluída! ---
echo.
pause
goto :menu

:installDriverEasyPortableSilent
echo Baixando o Driver Easy (Portátil)...
bitsadmin /transfer DriverEasyDownload /download /priority normal "https://github.com/iTPr0/FileExplorer/files/13810800/DriverEasy.zip" "%USERPROFILE%\Downloads\DriverEasy.zip"
echo.
echo --- Download concluído! ---
echo.
echo Extraindo o Driver Easy (Portátil)...
powershell -command "Expand-Archive -Path '%USERPROFILE%\Downloads\DriverEasy.zip' -DestinationPath '%USERPROFILE%\Downloads\DriverEasy' -Force"
echo.
echo Instalando o Driver Easy (Silencioso/Portátil)...
start /min "" "%USERPROFILE%\Downloads\DriverEasy\DriverEasy.exe" /PORTABLE=1
echo.
echo --- Instalação do Driver Easy (Silencioso/Portátil) Concluída! ---
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