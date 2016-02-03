@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET _mode=long
FOR %%O IN (%*) DO (
	IF "%%O"=="-s" SET _mode=short
)
IF EXIST .git (
	CALL :STATUS
) ELSE (
	FOR /f "delims=" %%a IN ('dir /ad /b') DO (
		PUSHD "%%a"
		IF EXIST .git CALL :SHORT
		@ECHO:
		POPD
	)	
)
GOTO :EOF

:: Display the status details.
:STATUS
IF "!_mode!"=="short" (	
	CALL :SHORT
)
IF "!_mode!"=="long" (
	CALL :LONG
)
GOTO :EOF

:: Display a single line about the status
:SHORT
cd
git status --short --branch
GOTO :EOF

:: Display a full report
:LONG
git remote -v
@ECHO:
git branch
@ECHO:
git status
GOTO :EOF
