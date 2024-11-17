@echo off
setlocal

set "regPath=HKEY_LOCAL_MACHINE\SOFTWARE"
set "outputFile=backup_software.reg"

echo Backup copy of registry: %regPath%
echo Backup path: %outputFile%

reg export "%regPath%" "%outputFile%" /y

if errorlevel 1 (
    echo Error
) else (
    echo Success
)

endlocal
pause