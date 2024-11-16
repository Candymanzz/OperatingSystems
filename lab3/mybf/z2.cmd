@echo off

if "%~1"=="" (
    echo err p1
    exit /b 1
)

if "%~2"=="" (
    echo err p2
    exit /b 1
)

if not exist "%~2" (
    echo err p22
    exit /b 1
)

for %%f in (*.txt) do (
    if /I not "%%~nxf"=="%~1" (
        xcopy "%%f" "%~2\" /D /Y
    ) else (
        echo Miss file %%f.
    )
)