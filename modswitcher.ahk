#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
settFile := A_ScriptDir . "\settings.ini"
FileList := ""

if !fileexist(settFile) {
	Msgbox,, Mod Switcher, you haven't selected the modfolder location`nClick okay to continue
	FileSelectFolder, Dest, c:\users
	if errorlevel {
		Msgbox,, Mod Switcher, You have cancelled the action!
		exitapp
		}
	else {
	IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS 
	
	}
}
else {
	Msgbox,, Mod Switcher, ModSwitcher is starting! `n Click okay to continue
	IniRead, dest, %A_ScriptDir%\settings.ini, start, MODS
}
#include %A_ScriptDir%\GUI\mainGUI.ahk
#include %A_ScriptDir%\GUI\settingGUI.ahk
SetWorkingDir %A_ScriptDir%