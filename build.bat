@echo off

set basepath=%~dp0

:: Setup ::
:: Put the location of your AddonBuilder.exe here ::
set builder=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe
set toolsdir=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools

set Signkey=%basepath:~0,-1%\qip.biprivatekey

:: Put the source of the Project here ( where the addon folders are ) ::
set source=%basepath:~0,-1%\dev

:: Put the place where you want the pbos to land here ::
set destination=%basepath:~0,-1%\@EasyRFTrack\addons

:: Put the addon prefix here ( your addons should all start with this, ie. AGM for all the agm addons [ AGM_Medical, AGM_Core, etc. ])
set prefix=

:: DON'T TOUCH ME ::
cd %source%
if not exist "%destination%" mkdir "%destination%"
for /d %%G in ("%prefix%*") do "%builder%" "%source%\%%G" "%destination%" -prefix="x\cl\addons\%%G" -toolsDirectory="%toolsdir%" -sign="%Signkey%" -packonly -clear
pause