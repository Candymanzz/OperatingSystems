Set objNetwork = CreateObject("WScript.Network")
userName = objNetwork.UserName

shortcutFolder = "C:\Users\" & userName & "\Favorites" 
shortcutName = "Блокнот" 
targetPath = "notepad.exe" 
iconPath = "C:\Windows\System32\notepad.exe" 
hotkey = "CTRL+SHIFT+N" 

Set objShell = CreateObject("WScript.Shell")

Set shortcut = objShell.CreateShortcut(shortcutFolder & "\" & shortcutName & ".lnk")

shortcut.TargetPath = targetPath
shortcut.IconLocation = iconPath
shortcut.Hotkey = hotkey
shortcut.WindowStyle = 1 
shortcut.Description = "Ярлык для Блокнота" 

shortcut.Save

WScript.Echo "Ярлык создан в " & shortcutFolder