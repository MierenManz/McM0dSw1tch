#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
settFile := A_ScriptDir . "\settings.ini"
if !fileexist(settFile) {
	msgbox, you haven't selected the modfolder location`nClick okay to continue
	FileSelectFolder, loc, c:\users
	if errorlevel {
		msgbox, you cancelled selecting a folder
		exitapp
		}
	else {
	fileappend, settings.ini
	IniWrite, %loc%, %A_ScriptDir%\settings.ini, start, MODS
	
	}
}
else {
	Msgbox, ModSwitcher is starting! `n Click okay to continue
}