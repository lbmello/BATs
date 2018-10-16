@echo off
cls
:menu

Usuario: %username%
                   
echo          PROXY UNIDADES
echo  ==================================
echo * 1. Desativar Windows Update      * 
echo * 2. Ativar Windows Update         *
echo * 3. Sair                          *
echo  ==================================


set /p opcao= Escolha uma opcao: 
echo ------------------------------
if %opcao% equ 1 goto opcao1
if %opcao% equ 2 goto opcao2

:opcao1
cls
net stop wuauserv
sc stop wuauserv
sc config wuauserv start = disabled
echo ==============================================
echo *         WINDOWS UPDATE DESATIVADO          *
echo ==============================================
pause
goto menu

:opcao2
cls
sc config wuauserv start = auto
net start wuauserv
sc start wuauserv
echo ==============================================
echo *           WINDOWS UPDATE ATIVADO           *
echo ==============================================
pause
goto menu

:opcao6
exit