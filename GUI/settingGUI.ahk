Setmen: ;called from <mainGUI>
	{
	Gui, setts:New
	Gui, setts:add, button, x0 y0 w180 h22 gLocchange, Change modfolder location
	Gui, setts:add, button, x0 y30 w180 h22 gFeed, Give me feedback :D
	Gui, setts:Show
	Gui, indx:Hide
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
	} else {
		IniWrite, %Dest%, %A_ScriptDir%\settings.ini, start, MODS
	}
	return
}

settsGuiClose:
	{
	Gui, indx:Show
	}
