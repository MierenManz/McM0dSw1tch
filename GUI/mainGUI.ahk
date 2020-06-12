Gxloc := 0
Gyloc := 0
FileList := ""
Loop, Files, %A_ScriptDir%\*.*, D
    FileList .= "`n" A_LoopFileName
Sort, FileList, R
Mods := StrSplit(FileList, "`n")

Gui, indx:New
modpacksamount := Mods.Length()

if (modpacksamount = 0) {
	Msgbox,, Mod Switcher, You got no modpacks :-(
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
		Gui, indx:Add, Button, x%Gxloc% y%Gyloc% w55 h22 v%element% gModmove, %element%
		Gxloc := Gxloc+60
	}
}

Menu MenuBar, Add, Settings, Setmen
;Menu MenuBar, Add, Modpacks, ModP ADD THIS BACK ONCE GOOD
Gui indx:Menu, MenuBar
Gui, indx:Add, Button, x%Gxloc% y%Gyloc% w55 h30 v%element% gRem, Remove mods
Gui, indx:Show
return

Rem:
	{
	FileRemoveDir, %Dest%, 1
	Msgbox,, Mod Switcher, All mods have been removed
	return
}

Modmove:
	{
	FileRemoveDir, %Dest%, 1
	FileCopyDir, %A_ScriptDir%\%A_guiControl%, %Dest%, 1
	Msgbox,, Mod Switcher, Finished installing modpack, click OK to continue
	return
}

indxGuiClose:
	{
	exitapp
	}