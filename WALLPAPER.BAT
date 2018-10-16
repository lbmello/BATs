echo off
del %userprofile%\AppData\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper
del %userprofile%\AppData\Roaming\Microsoft\Windows\Themes\CachedFiles\*.jpg
echo on

echo "ARQUIVOS APAGADOS COM SUCESSO"
pause

echo "O SISTEMA VAI REINICIAR"
echo "FIM"
pause

shutdown -r -t 02
