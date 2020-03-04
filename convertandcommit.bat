:: Name: convertandcommit.bat
:: Converts iPython Notebooks to PDF and commits them with git
:: Author: turbonoodles

REM Filename of the notebook we are operating on should be the first and only argument
SET filename = %1 

REM Convert notebook to pdf, ignoring cells tagged "nbconvert-hide"

start jupyter nbconvert notebook ^
--TagRemovePreprocessor.enabled=True ^
--to pdf ^
--output-dir pdf ^
--TagRemovePreprocessor.remove_cell_tags="['nbconvert-hide']"

REM Stage all changes and commit

start git stage .
REM start git commit