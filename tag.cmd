@ECHO OFF
IF "%~1"=="" (
	GOTO :EOF
)
IF "%~2"=="" (
	git tag -a %~1 -m "version %~1"
) ELSE (
	git tag -a %~1 -m "%~2"
)
git push origin %~1