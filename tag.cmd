:: Handles the creating and deleting of tags.
@ECHO OFF
:: Show usage
IF "%~1"=="" (
	ECHO usage: tag [-d] [-l] ^<version^> ["message"]
	ECHO:
	ECHO -d    Will delete a tag on the origin
	ECHO -l    Will list all tags
	GOTO :EOF
)
:: List all tags
IF "%~1"=="-l" (
	git tag -n
	GOTO :EOF
)
:: Delete a tag
IF "%~1"=="-d" (
	IF "%~2"=="" GOTO :EOF
	git tag -d %~2
	git push origin :refs/tags/%~2
	GOTO :EOF
)
:: Create a tag
IF "%~2"=="" (
	git tag -a %~1 -m "version %~1"
) ELSE (
	git tag -a %~1 -m "%~2"
)
git push origin %~1