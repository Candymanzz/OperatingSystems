set WShShell = WScript.CreateObject("WScript.Shell")

Dim extension, regPath, shell, regValue
extension = InputBox("Write file extension (example, .7z):", "Searching...")


regPath = WShShell.RegRead("HKEY_CLASSES_ROOT\" & extension & "\")

On Error Resume Next
If Err.Number <> 0 Then
Mess = "Error of reading reg data " & Chr(10) & "Error number: " & Err.Number & Chr(10) & "Discription: " & Err.description
WShShell.Popup Mess
Else
WShShell.Popup regPath
End If
On Error Goto 0