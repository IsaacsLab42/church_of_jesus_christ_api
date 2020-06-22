@ECHO OFF

pushd %~dp0

REM Command file for Sphinx documentation

if "%SPHINXBUILD%" == "" (
	set SPHINXBUILD=sphinx-build
)

if "%SPHIXAPIDOC%" == "" (
	set SPHIXAPIDOC=sphinx-apidoc
)

if "%M2R%" == "" (
	set M2R=m2r
)

set SOURCEDIR=source
set BUILDDIR=build

if "%1" == "" goto help

%SPHINXBUILD% >NUL 2>NUL
if errorlevel 9009 (
	echo.
	echo.The 'sphinx-build' command was not found. Make sure you have Sphinx
	echo.installed, then set the SPHINXBUILD environment variable to point
	echo.to the full path of the 'sphinx-build' executable. Alternatively you
	echo.may add the Sphinx directory to PATH.
	echo.
	echo.If you don't have Sphinx installed, grab it from
	echo.http://sphinx-doc.org/
	exit /b 1
)

%M2R% ..\README.md --overwrite
move ..\README.rst %SOURCEDIR%
%SPHIXAPIDOC% -fTo %SOURCEDIR%/modules  ".." "..\setup.py"
%SPHINXBUILD% -M %1 %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%
goto end

:help
%SPHINXBUILD% -M help %SOURCEDIR% %BUILDDIR% %SPHINXOPTS% %O%

:end
popd