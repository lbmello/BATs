@echo off

REM [Criado e Mantido por Lucas Bulegon Mello - lucasbmello96@gmail.com]
REM [Script criado para ativar, desativar e configurar proxy e exceções]

:menu
cls
echo  =======================================================================
echo *                      CONFIGURACAO DE PROXY                            *
echo *                             SUPORTE                                   *
echo  =======================================================================
echo Usuario: %username%
echo Nome Computador: %computername%
                   
echo          PROXY UNIDADES
echo  ==================================
echo * 1. Ativar Proxy                  * 
echo * 2. Desativar Proxy               *
echo * 3. Alterar Proxy                 *
echo * 4. Configurar Excecoes           *
echo * 5. Retirar Excecoes              * 
echo * 6. Sair                          * 
echo  ==================================

set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2
if %opcao% equ 3 goto opcao3
if %opcao% equ 4 goto opcao4
if %opcao% equ 5 goto opcao5
if %opcao% equ 6 goto opcao6
if %opcao% GEQ 6 goto opcao6

:opcao1
cls
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000001 /f
echo ==================================
echo *      PROXY ATIVADO             *
echo ==================================
pause
goto menu


:opcao2
cls
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000000 /f
echo ==================================
echo *      PROXY DESATIVADO          *
echo ==================================
pause
goto menu

:opcao3
cls

echo DIGITE O ENDERECO DE PROXY

set /p PROXY= 

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0x00000001 /f

REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "%PROXY%:8080" /f
cls
echo ==================================
echo *      PROXY ALTERADO            *
echo *   ADICIONE AS EXCECOES!        *
echo ==================================

pause
goto menu

:opcao4
cls
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "google.com.br<local>" /f
echo ==================================
echo *      EXCECAO SETADA            *
echo ==================================
pause
goto menu

:opcao5
cls
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "" /f
echo ==================================
echo *      EXCECAO RETIRADA          *
echo ==================================
pause
goto menu

:opcao6
cls
exit

:opcao6
echo ==============================================
echo * Opcao Invalida! Escolha outra opcao do menu *
echo ==============================================
pause
goto menu