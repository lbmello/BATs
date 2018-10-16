@echo off

cls
:menu
cls
echo  =======================================================================
echo *                         CONFIGURACAO DE IP                            *
echo  =======================================================================
echo Usuario: %username%
echo Nome Computador: %computername%

netsh interface ipv4 show interfaces

echo DIGITE O NOME DA INTERFACE:
set /p INTERFACE=

cls


echo  ===================================
echo *             SUPORTE              *
echo  ===================================


echo        SELECIONE O AMBIENTE
echo  ==================================
echo * 1. Educacional                   * 
echo * 2. Administrativo                *
echo * 3. Sair                          * 
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto EDUC
if %opcao% equ 2 goto ADM
if %opcao% equ 3 goto FIM

:EDUC
cls
echo SELECIONE A CONFIGURACAO DE IP:
choice /C FAC /M "PRESSIONE: [F]ixo, [A]utomatico ou [C]ancelar"
IF errorlevel=3 goto menu
IF errorlevel=2 goto AUTOMATICO
IF errorlevel=1 goto FIXO_EDUC

:FIXO_EDUC
cls
set MASCARA=255.255.254.0

set DNS=8.8.8.8
set DNS2=8.8.4.4
echo DIGITE O IP DO COMPUTADOR
set /p IP=
set GATEWAY=192.168.0.1

netsh interface ipv4 set address name=%INTERFACE% static %IP% %MASCARA% %GATEWAY%

netsh interface ipv4 add dnsservers name=%INTERFACE% %DNS%
netsh interface ipv4 add dnsservers name=%INTERFACE% %DNS2% index=2

pause
goto :menu

:ADM
cls
echo SELECIONE A CONFIGURACAO DE IP:
choice /C FAC /M "PRESSIONE: [F]ixo, [A]utomatico ou [C]ancelar"
IF errorlevel=3 goto menu
IF errorlevel=2 goto AUTOMATICO
IF errorlevel=1 goto FIXO_ADM


:FIXO_ADM
cls
set MASCARA=255.255.255.0

set DNS=8.8.8.8
set DNS2=8.8.8.8
echo DIGITE O IP DO COMPUTADOR
set /p IP=
echo DIGITE O GATEWAY DO COMPUTADOR
set /p GATEWAY=

netsh interface ipv4 set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY%

netsh interface ipv4 add dnsservers name="%INTERFACE%" "%DNS%"
netsh interface ipv4 add dnsservers name="%INTERFACE%" "%DNS2%" index=2
cls
pause
goto :menu

:AUTOMATICO

netsh interface ip set address name="%INTERFACE%" dhcp
netsh interface ip set dnsservers name="%INTERFACE%" dhcp
goto :menu

:FIM
exit
@echo off

