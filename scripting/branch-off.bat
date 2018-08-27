:: Example: scripting\branch-off unity-sample-project DummyProject 2018.2.4f1

SET Submodule=submodules\%1
SET Project=%2
SET TAG=%Project%-%3
SET Message="Used as submodule in %Project%"
SET Branch=submodule-%Project%

:: Try to change directory
SET CurrentDirectory=%cd%
CD %Submodule%
IF %errorlevel% EQU 1 GOTO :missingDirectory

:: On success, create new branch with tag and upload it to remote repository
git checkout -b %Branch%
git tag -a %TAG% -m %Message%
git push --set-upstream origin %Branch%
git push
git push origin %TAG%

CD %CurrentDirectory%

GOTO :EOF


:missingDirectory
ECHO Submodule not found: %Submodule%
GOTO :EOF
