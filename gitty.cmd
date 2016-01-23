@ECHO OFF
git status
IF %ERRORLEVEL% NEQ 0 (EXIT /B -1)

git add --all
IF %ERRORLEVEL% NEQ 0 (EXIT /B -1)
IF "%~1"=="" GOTO END_BATCH

git commit -m %1
IF %ERRORLEVEL% NEQ 0 (GOTO END_BATCH)

FOR /f %%i IN ('git config --local remote.origin.url') DO SET URL=%%i
IF x%URL:thinkingmedia=%==x%URL% GOTO PUSH_CHANGES
SET /P AREYOUSURE=Push changes (Y/[N])?
IF /I "%AREYOUSURE%" NEQ "Y" GOTO END_BATCH
:PUSH_CHANGES
git push

:END_BATCH