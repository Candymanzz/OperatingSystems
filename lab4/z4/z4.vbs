Sub CreateWebShortcut()
    shortcutFolder = "C:\Users\" & CreateObject("WScript.Network").UserName & "\Desktop" 
    shortcutName = "Мой Веб-сайт" 
    targetURL = "https://www.example.com" 

    Set objShell = CreateObject("WScript.Shell")
    Set shortcut = objShell.CreateShortcut(shortcutFolder & "\" & shortcutName & ".lnk")
    
    shortcut.TargetPath = targetURL
    shortcut.IconLocation = "C:\Path\To\Your\Icon.ico" 
    shortcut.Description = "Ярлык для веб-узла"
    shortcut.Save

    WScript.Echo "Ярлык для веб-узла создан в " & shortcutFolder
End Sub

Sub DisplayComputerInfo()
    Set objNetwork = CreateObject("WScript.Network")
    userName = objNetwork.UserName
    computerName = objNetwork.ComputerName

    WScript.Echo "Имя пользователя: " & userName
    WScript.Echo "Имя компьютера: " & computerName
End Sub

Sub DisplayAndSetDefaultPrinter()
    Set objWMIService = GetObject("winmgmts:\\.\root\cimv2")
    Set colPrinters = objWMIService.ExecQuery("SELECT * FROM Win32_Printer")

    For Each objPrinter in colPrinters
        WScript.Echo "Принтер: " & objPrinter.Name
    Next

    If Not colPrinters Is Nothing Then
        For Each objPrinter in colPrinters
            objPrinter.SetDefaultPrinter()
            WScript.Echo "Принтер установлен по умолчанию: " & objPrinter.Name
            Exit For
        Next
    End If
End Sub

Sub DisplayNetworkDrives()
    Set objNetwork = CreateObject("WScript.Network")
    Dim drives
    drives = objNetwork.EnumNetworkDrives

    If UBound(drives) >= 0 Then
        WScript.Echo "Подключенные сетевые диски:"
        For i = 0 To UBound(drives) Step 2
            WScript.Echo drives(i) & " -> " & drives(i + 1)
        Next
        WScript.Echo "Количество подключенных сетевых дисков: " & (UBound(drives) / 2 + 1)
    Else
        WScript.Echo "Нет подключенных сетевых дисков."
    End If
End Sub

Sub DisconnectNetworkDrive()
    On Error Resume Next 

    Set objNetwork = CreateObject("WScript.Network")
    driveLetter = "Z:" 

    objNetwork.RemoveNetworkDrive driveLetter, True, True
    If Err.Number <> 0 Then
        WScript.Echo "Ошибка при отключении диска: " & Err.Description
        Err.Clear
    Else
        WScript.Echo "Сетевой диск " & driveLetter & " успешно отключен."
    End If

    On Error GoTo 0 
End Sub

CreateWebShortcut()
DisplayComputerInfo()
DisplayAndSetDefaultPrinter()
DisplayNetworkDrives()
DisconnectNetworkDrive()