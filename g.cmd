@ECHO OFF
IF EXIST .git (
	git remote -v
	@ECHO:
	git branch
	@ECHO:
	git status
) ELSE (
	@ECHO [31;1m Not a Git directory.
)