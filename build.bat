@echo off

set basepath=%~dp0

:: Setup ::
:: Put the location of your AddonBuilder.exe here ::
set builder=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools\AddonBuilder\AddonBuilder.exe
set toolsdir=C:\Program Files (x86)\Steam\steamapps\common\Arma 3 Tools

set signkey=%basepath:~0,-1%\qip.biprivatekey

:: Put the source of the Project here ( where the addon folders are ) ::
set source=%basepath:~0,-1%\dev

:: Put the place where you want the pbos to land here ::
set destination=%basepath:~0,-1%\@EasyRFTrack\addons

:: DON'T TOUCH ME ::
if not exist "%destination%" mkdir "%destination%"
for /d %%G in ("%source%\*") do (
	if exist %%G\$PBOPREFIX$ (
		set /p prefix=<%%G\$PBOPREFIX$
		if [%prefix%] NEQ [] set prefixcmd=-prefix=%prefix%
	)

	"%builder%" "%%G" "%destination%" -toolsDirectory="%toolsdir%" -sign="%signkey%" -packonly -clear %prefixcmd%
)
pause