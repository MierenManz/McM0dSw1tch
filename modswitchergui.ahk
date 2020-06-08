#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
settFile := A_ScriptDir . "\settings.ini" ; settings file
if !fileexist(settFile) { ; if settings file doesn't exist, it will be created
	msgbox, you haven't selected the modfolder location`nClick okay to continue ; messagebox
	FileSelectFolder, Dest, c:\users ; Select minecraft mods folder
	if errorlevel { ; if the operation is cancelled, stop the program
		msgbox, you cancelled selecting a folder
		exitapp
		}
	else {
	fileappend, settings.ini ; create the settings file
	IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS ; write the mods folder location to the settings file
	
	}
}
else {
	Msgbox, ModSwitcher is starting! `n Click okay to continue
}
IniRead, dest, %A_ScriptDir%\settings.ini, start, MODS ; reads mods folder location
FileList := ""
Loop, Files, %A_ScriptDir%\*.*, D
    FileList .= "`n" A_LoopFileName
Sort, FileList, R
msgbox % FileList
Mods := StrSplit(FileList, "`n")
Gui, New
Yloc := 0
for modpacknum, element in Mods {
Yloc := Yloc+50 
	Gui, Add, Button, x0 %Yloc% w55 h22 v%element% gmodmove, %element%
}
	gui, show
	return
		modmove:
	{
	msgbox, %A_guiControl%
	}
return