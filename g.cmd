@ECHO OFF
SETLOCAL EnableDelayedExpansion
SET _SHORT=0
IF EXIST .git (
	FOR /F "tokens=1,2,3" %%A IN ('git remote -v') DO SET REMOTE=%%B
	FOR %%O IN (%*) DO (
		IF "%%O"=="-s" (
			SET _SHORT=1
		)
	)
	IF "!_SHORT!"=="0" (
		git remote -v
		@ECHO:
		git branch
		@ECHO:
		git status
	) ELSE (
		@ECHO [31;1m !REMOTE!
	)
	GOTO EXIT
) ELSE (
	@ECHO [31;1m Not a Git directory.
)
:EXIT