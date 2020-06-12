;|------------------------------------------------------------------------|
;|		currently in the works. Can't get it to work without exception on |
;|		Windows Defender. This is a huge security risk!! That is why this |
;|		is not done yet.												  |
;|------------------------------------------------------------------------|
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
ModP:;Called from <mainGUI>
	{
	Gui, Modpdl:New
	Gui, Modpdl:add, button, x0 y0 w180 h22 gTekkit, Tekkit
	Gui, Modpdl:add, button, x0 y30 w180 h22 gTekclassic, Tekkit Classic
	Gui, Modpdl:Show
	return
}
Tekkit:
	{
	urldownloadtofile, https://download846.mediafire.com/tl62xqbcsazg/v81d9o0oubpuu0d/Tekkit.zip, %A_ScriptDir%\ahk.zip
	ToolTip Download completed
	sZip := A_ScriptDir . "\ahk.zip"  ;Zip file to be created
	sUnz := A_ScriptDir
	Settimer, RemoveTT, 500
	Unz(sZip,sUnz)
	msgbox, Tekkit foobar
	return
	
	Unz(sZip, sUnz) {
		fso := ComObjCreate("Scripting.FileSystemObject")
		If !fso.FolderExists(sUnz)
		  fso.CreateFolder(sUnz)
		psh  := ComObjCreate("Shell.Application")
		zippedItems := psh.Namespace( sZip ).items().count
		psh.Namespace( sUnz ).CopyHere( psh.Namespace( sZip ).items, 4|16 )
		ToolTip
		Loop {
			sleep 10
			unzippedItems := psh.Namespace( sUnz ).items().count
			math := unzippedItems.count() / zippedItems.count() * 100
			ToolTip Unzipping in progress.. %math% done
			if (zippedItems.count() = unzippedItems.count())
				break
		}
		ToolTip
	}
}
Tekclassic:
	{
	msgbox, classic foobar
	return
}
RemoveTT:
		{
		ToolTip
		return
	}