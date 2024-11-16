Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")

Set colProcessors = objWMIService.ExecQuery("SELECT Name FROM Win32_Processor")
For Each objProcessor in colProcessors
    cpuInfo = objProcessor.Name
Next

Set colOperatingSystems = objWMIService.ExecQuery("SELECT Name FROM Win32_OperatingSystem")
For Each objOS in colOperatingSystems
    osInfo = objOS.Name
Next

WScript.Echo "CPU: " & cpuInfo
WScript.Echo "OS: " & osInfo