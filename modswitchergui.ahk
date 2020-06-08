#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
settFile := A_ScriptDir . "\settings.ini" ; settings file

if !fileexist(settFile) { ; if settings file doesn't exist, it will be created
	Msgbox,, Mod Switcher, you haven't selected the modfolder location`nClick okay to continue ; messagebox
	FileSelectFolder, Dest, c:\users ; Select minecraft mods folder
	if errorlevel { ; if the operation is cancelled, stop the program
		Msgbox,, Mod Switcher, You have cancelled the action!
		exitapp
		}
	else {
	fileappend, settings.ini ; create the settings file
	IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS ; write the mods folder location to the settings file
	
	}
}
else {
	Msgbox,, Mod Switcher, ModSwitcher is starting! `n Click okay to continue
}

IniRead, dest, %A_ScriptDir%\settings.ini, start, MODS ; reads mods folder location
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