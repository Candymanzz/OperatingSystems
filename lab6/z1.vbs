Option Explicit

Dim folderPath, lastAccessTime, file, fso, folder, files, readOnlyFiles
Dim totalSize, diskInfoFile, disk

' Укажите путь к папке
folderPath = "D:\GitHubPj\sem555\os\OperatingSystems\lab6" ' Замените на актуальный путь
' Введите время последнего обращения
lastAccessTime = #12/01/2023# ' Замените на нужную дату

Set fso = CreateObject("Scripting.FileSystemObject")
Set folder = fso.GetFolder(folderPath)
Set files = folder.Files
Set readOnlyFiles = CreateObject("Scripting.Dictionary")

' Проверяем файлы в папке
For Each file In files
    If (file.Attributes And 1) = 1 Then ' Проверка на атрибут "Только для чтения"
        If file.DateLastAccessed >= lastAccessTime Then
            readOnlyFiles.Add file.Name, file.Size
            totalSize = totalSize + file.Size
        End If
    End If
Next

' Выводим список файлов
If readOnlyFiles.Count > 0 Then
    Dim output
    output = "Файлы только для чтения:" & vbCrLf
    For Each file In readOnlyFiles.Keys
        output = output & file & " - " & readOnlyFiles(file) & " байт" & vbCrLf
    Next
    output = output & "Общий размер: " & totalSize & " байт"
    MsgBox output
Else
    MsgBox "Нет файлов только для чтения с учетом заданного времени."
End If

' Получаем информацию о диске
Set disk = fso.GetDrive(fso.GetDriveName(folderPath))
diskInfoFile = "D:\GitHubPj\sem555\os\OperatingSystems\lab6\DiskInfo.txt" ' Убедитесь, что путь корректен

' Проверяем, существует ли папка для записи
If Not fso.FolderExists(fso.GetParentFolderName(diskInfoFile)) Then
    MsgBox "Папка для записи информации о диске не найдена."
    WScript.Quit
End If

' Записываем информацию в файл
Dim diskFile
Set diskFile = fso.CreateTextFile(diskInfoFile, True)
diskFile.WriteLine "Метка диска: " & disk.VolumeName
diskFile.WriteLine "Серийный номер: " & disk.SerialNumber
diskFile.WriteLine "Общий размер: " & FormatNumber(disk.TotalSize / 1024, 2) & " Кб"
diskFile.Close

MsgBox "Информация о диске записана в " & diskInfoFile