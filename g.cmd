@ECHO OFF
IF EXIST .git (
git remote -v
@ECHO:
git branch
@ECHO:
git status
) ELSE (
@ECHO Not a Git directory.
)