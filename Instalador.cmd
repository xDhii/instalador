@echo off
@break off
cls
echo Instalador - Automacao de Outbound via IDOC

echo Este processo irá instalar o Python 3.7.3, Git para poder prosseguir.
echo Se deseja continuar, pressione qualquer tecla
echo Caso contrario, feche esta janela.
echo Este processo leva ate 10 minutos
echo .
echo .
echo .

echo Deseja continuar?
set /P continuar="Digite S ou N: "
IF [continuar]==[S] (
    GOTO iniciar_install
)   ELSE    (
    GOTO finalizar_install
)
:iniciar_install
cls
echo Instalador - Automacao de Outbound via IDOC
echo Voce ja tem o python instalado? 
set /P python="Digite S ou N: "
echo .
echo .
echo .
IF [python]==[S] (
    GOTO instalar_python
)   ELSE    (
    GOTO pular_python
)

:instalar_python
bin\bin\wget.exe http://invqasrv18/tf.portal/downloads/python-3.7.3.exe
cls
echo Instalador - Automacao de Outbound via IDOC
echo Aguarde, instalando Python...
echo .
echo .
echo .
python-3.7.3.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del python-3.7.3.exe

:pular_python

cls
echo Instalador - Automacao de Outbound via IDOC
echo Voce ja tem o GIT instalado? 
set /P git="Digite S ou N: "
echo .
echo .
echo .

IF [git]==[S] (
    GOTO instalar_git
)   ELSE    (
    GOTO pular_git
)

:instalar_git
bin\bin\wget.exe http://invqasrv18/tf.portal/downloads/Git-2.22.0-64-bit.exe
cls
echo Instalador - Automacao de Outbound via IDOC
echo Aguarde, instalando Git...
echo .
echo .
echo .
Git-2.22.0-64-bit.exe  /VERYSILENT /NORESTART /NOCANCEL /SP- /CLOSEAPPLICATIONS /RESTARTAPPLICATIONS /COMPONENTS="icons,ext\reg\shellhere,assoc,assoc_sh"
del Git-2.22.0-64-bit.exe

:pular_git
git clone https://github.com/xDhii/idocmanager.git
CD bin
del /F/Q/S *.* > NUL
cd ..
RMDIR /Q/S bin

:finalizar_install
echo Finalizamos por aqui!
pause
python /idocmanager/Iniciar.py