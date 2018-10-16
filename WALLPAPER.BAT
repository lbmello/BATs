echo off

REM [Script usado para excluir arquivos de papel de parede em sistemas Windows.]
REM [Geralmente usado em redes com domínio e aplicação de GPO para alteração do Wallpaper.]

del %userprofile%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper
del %userprofile%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.jpg
echo on

echo "ARQUIVOS APAGADOS COM SUCESSO"
pause

echo "O SISTEMA VAI REINICIAR"
echo "FIM"
pause

shutdown -r -t 02
