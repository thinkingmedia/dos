@ECHO OFF
IF EXIST .git (
git remote -v
@ECHO:
git status
@ECHO:
git branch
) ELSE (
@ECHO Not a Git directory.
)