:: Name: convertandstage.bat
:: Converts iPython Notebooks to PDF and commits them with git
:: Author: turbonoodles

@ECHO off

:START

REM Filename of the notebook we are operating on should be the first and only argument
SET notebook=%1
ECHO Converting:
ECHO %notebook%
REM pause

:CONVERT
REM Convert notebook to pdf, ignoring cells tagged "nbconvert-hide"

START jupyter nbconvert %notebook% ^
--TagRemovePreprocessor.enabled=True ^
--to pdf ^
--output-dir pdf ^
--TagRemovePreprocessor.remove_cell_tags="['nbconvert-hide']"

goto END

:GIT

REM Stage all changes and commit

START git stage %notebook% 
START git stage pdf/%notebook%
REM start git commit

:END