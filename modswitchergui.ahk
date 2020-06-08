#NoEnv
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

Gui, indx:New
Gxloc := 0
Gyloc := 0
if (Mods = "") 	{
	Msgbox,, Mod Switcher, You got no modpacks :D
	exitapp
	}
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
		Gui, indx:Add, Button, x%Gxloc% y%Gyloc% w55 h22 v%element% gmodmove, %element%
		Gxloc := Gxloc+60
	}
}
Menu MenuBar, Add, Settings, Setmen
Gui indx:Menu, MenuBar
Gui, indx:Show
return
	
modmove:
	{
	FileRemoveDir, %Dest%, 1
	FileCopyDir, %A_ScriptDir%\%A_guiControl%, %Dest%, 1
	return
}
Setmen:
	{
	Gui, setts:New
	Gui, setts:add, button, x0 y0 w180 h22 gLocchange, Change modfolder location
	Gui, setts:add, button, x0 y30 w180 h22 gFeed, Give me feedback :D
	Gui, setts:Show
	return
}
Feed:
	{
	run, http://freesuggestionbox.com/pub/puhrnem
	return
	}
Locchange:
	{
	FileSelectFolder, Dest, c:\users
	if errorlevel {
		Msgbox,, Mod Switcher, You have cancelled the action!
		return
	} else {
		IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS
		return
}}
GuiClose:
	{
	Msgbox,, Mod Switcher, Bye :D
	exitapp
	}