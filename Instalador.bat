@echo off
@break off
cls
echo Instalador - Automacao de Outbound via IDOC

echo Este processo ira instalar o Python 3.7.3 e o Git para poder prosseguir.
echo Este processo leva ate 10 minutos
echo .
echo .
echo .
sleep 5

echo Deseja continuar?
set instalar=false
set /P continuar="Digite S ou N: "
IF %continuar% == S set instalar=true
IF %continuar% == s set instalar=true
IF %instalar% == true (
    GOTO iniciar_install
)
IF %instalar% == false (
    GOTO finalizar_install
)
:iniciar_install

cls
set %python%=false
echo Instalador - Automacao de Outbound via IDOC
echo Deseja instalar o Python 3.7.3?
set /P python="Digite S ou N: "
IF %python% == N set pular_python=true
IF %python% == n set pular_python=true
if pular_python == true (
    GOTO :pular_python
)

:instalar_python
bin\bin\wget.exe http://beatmakr.com/resources/python-3.7.3.exe
cls
echo Instalador - Automacao de Outbound via IDOC
echo Aguarde, instalando Python...
echo .
echo .
echo .
python-3.7.3.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del python-3.7.3.exe
pip install pyodbc

:pular_python

cls
set %git%=false
echo Instalador - Automacao de Outbound via IDOC
echo Deseja instalar o GIT?
set /P git="Digite S ou N: "
IF %git% == N set pular_git=true
IF %git% == n set pular_git=true
if pular_python == true (
    GOTO :pular_git
)

:instalar_git
bin\bin\wget.exe http://beatmakr.com/resources/Git-2.22.0-64-bit.exe
cls
echo Instalador - Automacao de Outbound via IDOC
echo Aguarde, instalando Git...
echo .
echo .
echo .
Git-2.22.0-64-bit.exe /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"
del Git-2.22.0-64-bit.exe

:pular_git
git clone https://github.com/xDhii/idocmanager.git
git clone https://github.com/xDhii/xmlsender.git
CD bin
del /F/Q/S *.* > NUL
cd ..
RMDIR /Q/S bin
python ./idocmanager/idocmanager.py

:finalizar_install
echo Finalizamos por aqui!
pause
del instalador.zip
del Instalador.bat