@echo off
@break off
cls
echo Instalador - Automação de Outbound via IDOC
echo
echo Este processo irá instalar o Python 3.7.3, Git para poder prosseguir.
echo Se deseja continuar, pressione qualquer tecla
echo Caso contrário, feche esta janela.

bin\bin\wget.exe http://invqasrv18/tf.portal/downloads/python-3.7.3.exe
python-3.7.3.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del python-3.7.3.exe
bin\bin\wget.exe http://invqasrv18/tf.portal/downloads/Git-2.22.0-64-bit.exe
Git-2.22.0-64-bit.exe  /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"
del Git-2.22.0-64-bit.exe
git clone https://github.com/xDhii/idocmanager.git
CD bin
del /F/Q/S *.* > NUL
cd ..
RMDIR /Q/S bin
del Instalador.cmd
del Instalador.zip
cd idocmanager
python Iniciar.py