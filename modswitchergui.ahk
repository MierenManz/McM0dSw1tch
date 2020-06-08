#NoEn
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
settFile := A_ScriptDir . "\settings.ini"

if !fileexist(settFile) {
	Msgbox,, Mod Switcher, you haven't selected the modfolder location`nClick okay to continue
	FileSelectFolder, Dest, c:\users
	if errorlevel {
		Msgbox,, Mod Switcher, You have cancelled the action!
		exitapp
		}
	else {
	fileappend, settings.ini
	IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS 
	
	}
}
else {
	Msgbox,, Mod Switcher, ModSwitcher is starting! `n Click okay to continue
}

IniRead, dest, %A_ScriptDir%\settings.ini, start, MODS
FileList := ""
Loop, Files, %A_ScriptDir%\*.*, D
    FileList .= "`n" A_LoopFileName
Sort, FileList, R
Mods := StrSplit(FileList, "`n")

Gui, New
Gxloc := 0
Gyloc := 0
for modpacknum, element in Mods {
	if (element = "") {
	}
	else {
	if (Gxloc >= 241) {
	Gxloc := 0
	Gyloc := Gyloc+30
	}
	else {
	}
		Gui, Add, Button, x%Gxloc% y%Gyloc% w55 h22 v%element% gmodmove, %element%
		Gxloc := Gxloc+60
	}
}
gui, show
return
	
modmove:
	{
	FileRemoveDir, %Dest%, 1
	FileCopyDir, %A_ScriptDir%\%A_guiControl%, %Dest%, 1
	return
	}
GuiClose:
	{
	Msgbox,, Mod Switcher, Bye :D
	exitapp
	}