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
    ' Укажите путь к папке с общим доступом и букву диска
    Dim networkPath, driveLetter
    networkPath = "\\PAVEL\ychoba" ' замените на ваш путь
    driveLetter = "Z:" ' замените на желаемую букву диска

    ' Подключаем сетевой диск
    Set objNetwork = CreateObject("WScript.Network")
    On Error Resume Next
    objNetwork.MapNetworkDrive driveLetter, networkPath
    If Err.Number <> 0 Then
        WScript.Echo "Ошибка подключения: " & Err.Description
        Err.Clear
    Else
        WScript.Echo "Сетевой диск " & driveLetter & " подключен к " & networkPath
    End If
    On Error GoTo 0

    ' Создаем объект для работы с файловой системой
    Set objFSO = CreateObject("Scripting.FileSystemObject")

    ' Получаем коллекцию дисков
    Set objDrives = objFSO.Drives

    ' Переменная для подсчета сетевых дисков
    networkDriveCount = 0

    ' Перебираем все диски и выводим сетевые
    For Each objDrive In objDrives
        If objDrive.DriveType = 3 Then ' 3 - это тип сетевого диска
            WScript.Echo "Сетевой диск: " & objDrive.DriveLetter & " - " & objDrive.ShareName
            networkDriveCount = networkDriveCount + 1
        End If
    Next

    ' Выводим общее количество сетевых дисков
    WScript.Echo "Общее количество сетевых дисков: " & networkDriveCount
End Sub

Sub DisconnectNetworkDrive()
    On Error Resume Next 

    Set objNetwork = CreateObject("WScript.Network")
    driveLetter = "E:" 

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