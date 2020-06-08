#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
FileList := ""
Loop, Files, %A_ScriptDir%\*.*, D
    FileList .= A_LoopFileName "`n"
Sort, FileList, R
msgbox % FileList
Mods := StrSplit(FileList, "`n")
loc := "C:\Users\User\Desktop\coding\mc modswitcher\" . Mods[1]
FileCopyDir, %loc%, C:\Users\User\Desktop\coding\mc modswitcher\dest, 1