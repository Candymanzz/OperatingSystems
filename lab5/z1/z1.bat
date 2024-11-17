@echo off
setlocal

set "REG_PATH=HKEY_LOCAL_MACHINE\SOFTWARE"
set "BACKUP_FILE=sf.sw.reg"

echo copy: %REG_PATH%
echo save: %BACKUP_FILE%

reg export "%REG_PATH%" "%BACKUP_FILE%" /y

if %errorlevel% neq 0 (
    echo err copy
) else (
    echo copies complete
)

endlocal
pause