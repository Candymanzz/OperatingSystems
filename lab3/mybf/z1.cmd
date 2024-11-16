@echo off

echo Starting copying .txt files to the root directory of the removable disk...

set "USB_DRIVE=E"

for %%f in (*.txt) do (
    echo copying %%f...
    xcopy "%%f" "%USB_DRIVE%:\" /D /Y
)

echo copy complete
endlocal