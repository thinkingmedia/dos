@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET _mode=long
IF EXIST .git (
	FOR /F "tokens=1,2,3" %%A IN ('git remote -v') DO SET REMOTE=%%B
	FOR %%O IN (%*) DO (
		IF "%%O"=="-s" SET _mode=short
	)
	
	:: Display a single line about the status
	IF "!_mode!"=="short" (
		git status --short --branch
	)
	
	:: Display a full report
	IF "!_mode!"=="long" (
		git remote -v
		@ECHO:
		git branch
		@ECHO:
		git status
	)
	
) ELSE (
	@ECHO [31;1m Not a Git directory.
)
:EXIT