#NoTrayIcon
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=..\..\..\HACK KIT\ICON DIRECTORY\_Icn database\widescreen_tv-512.ico
#AutoIt3Wrapper_Outfile_x64=win11-show-desktop.exe
#AutoIt3Wrapper_Compression=4
#AutoIt3Wrapper_UseUpx=y
#AutoIt3Wrapper_Res_Comment=Windows 11 ShowDesktop Alternative Developed by Amirhosseinhpv (https://hpv.im/)
#AutoIt3Wrapper_Res_Description=Windows 11 ShowDesktop Alternative
#AutoIt3Wrapper_Res_Fileversion=1.0.0.10
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_ProductName=Windows 11 ShowDesktop Alternative
#AutoIt3Wrapper_Res_ProductVersion=1.0.0.0
#AutoIt3Wrapper_Res_CompanyName=Developed by Amirhosseinhpv (https://hpv.im/)
#AutoIt3Wrapper_Res_LegalCopyright=Developed by Amirhosseinhpv (https://hpv.im/)
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include <TrayConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <Misc.au3>
If _Singleton("Win11AlternativeShowDesktop", 1) = 0 Then  Exit
Opt("GUIOnEventMode", 1)
Opt("TrayMenuMode", 3)
Opt("TrayOnEventMode", 1)
Global $inArea = False
Global $taskbar = WinGetPos("[CLASS:Shell_TrayWnd]")
Global $hGUI = GUICreate("", 440, 110, -1, -1, -1, BitOR($WS_EX_TOOLWINDOW,$WS_EX_TOPMOST,$WS_EX_WINDOWEDGE))
GUISetBkColor("0xFFFFFF")
GUISetFont(12, 400, 0, "Segoe UI")
_Bsl256Jpg ( "blackswan", @TempDir & "\", 0 )
GUICtrlCreatePic(@TempDir & "\blackswan", 0,0, 100, 100)
Local $Label1 = GUICtrlCreateLabel("Windows 11 Alternative ShowDesktop", 100+8, 25+0, 303, 25)
GUICtrlSetBkColor($Label1, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetFont($Label1, 12, 800, 0, "Segoe UI Black")
Local $Label2 = GUICtrlCreateLabel("Developed by Amirhosseinhpv", 100+8, 30+25, 200, 25)
GUICtrlSetBkColor($Label2, $GUI_BKCOLOR_TRANSPARENT)
GUICtrlSetFont($Label2, 11, 400, 0, "Segoe UI")
Local $Label3 = GUICtrlCreateLabel("(https://hpv.im/)", 100+202, 30+25, 110, 25)
GUICtrlSetOnEvent($Label3, "opensite")
GUICtrlSetCursor($Label3 , 0)
GUICtrlSetFont(-1, 11, 400, 4, "Segoe UI Bold")
GUICtrlSetColor(-1, 0x0078D7)
GUISetOnEvent(-3, "minimize_app")
TrayCreateItem("About")
TrayItemSetState(-1, 512)
TrayItemSetOnEvent(-1, "show_app")
TrayCreateItem("")
TrayCreateItem("Exit")
TrayItemSetOnEvent(-1, "close_app")
TraySetOnEvent($TRAY_EVENT_PRIMARYDOUBLE, "show_app")
TraySetState($TRAY_ICONSTATE_SHOW)
GUISetState(@SW_HIDE, $hGUI)
TraySetIcon(@ScriptFullPath, -1)
TraySetToolTip("Win11 Alt. ShowDesktop"  & @CRLF & @CRLF & "> Amirhosseinhpv" & @CRLF & "> its@hpv.im" & @CRLF & "> https://hpv.im")
While 1
	Sleep(750)
	Local $aPos = MouseGetPos()
	$inArea = False
	If (  (_IsPressed ( 01 ) OR _IsPressed ( 02 ) ) AND (abs($taskbar[2] - $aPos[0]) < 12)) Then
		If (Abs(($taskbar[1] + $taskbar[3]) - $aPos[1]) < $taskbar[3]) Then
			$inArea = True
		EndIf
	EndIf
	If ($inArea == True) Then
		WinMinimizeAll()
	EndIf
WEnd
Func show_app()
	GUISetState(@SW_SHOW, $hGUI)
EndFunc
Func minimize_app()
		GUISetState(@SW_HIDE, $hGUI)
EndFunc
Func close_app()
	Exit
EndFunc   ;==>close_app
Func opensite()
	ShellExecute("https://hpv.im/", "", "", "", @SW_MAXIMIZE)
EndFunc
Func _Bsl256Jpg ( $sFileName, $sOutputDirPath, $iOverWrite=0 )
    Local $sFileBin = "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"
    $sFileBin &= "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"
    $sFileBin &= "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"
    $sFileBin &= "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"
    $sFileBin = Binary ( _Base64Decode ( $sFileBin ) )
    If Not FileExists ( $sOutputDirPath ) Then DirCreate ( $sOutputDirPath )
    If StringRight ( $sOutputDirPath, 1 ) <> '\' Then $sOutputDirPath &= '\'
    Local $sFilePath = $sOutputDirPath & $sFileName
    If FileExists ( $sFilePath ) Then
        If $iOverWrite = 1 Then
            If Not Filedelete ( $sFilePath ) Then Return SetError ( 2, 0, $sFileBin )
        Else
            Return SetError ( 0, 0, $sFileBin )
        EndIf
    EndIf
    Local $hFile = FileOpen ( $sFilePath, 16+2 )
    If $hFile = -1 Then Return SetError ( 3, 0, $sFileBin )
    FileWrite ( $hFile, $sFileBin )
    FileClose ( $hFile )
    Return SetError ( 0, 0, $sFileBin )
EndFunc ;==> _Bsl256Jpg ()
Func _Base64Decode ( $input_string ) ; by trancexx
     Local $struct = DllStructCreate ( 'int' )
     Local $a_Call = DllCall ( 'Crypt32.dll', 'int', 'CryptStringToBinary', 'str', $input_string, 'int', 0, 'int', 1, 'ptr', 0, 'ptr', DllStructGetPtr ( $struct, 1 ), 'ptr', 0, 'ptr', 0 )
     If @error Or Not $a_Call[0] Then Return SetError ( 1, 0, '' )
     Local $a = DllStructCreate ( 'byte[' & DllStructGetData ( $struct, 1) & ']' )
     $a_Call = DllCall ( 'Crypt32.dll', 'int', 'CryptStringToBinary', 'str', $input_string, 'int', 0, 'int', 1, 'ptr', DllStructGetPtr ( $a ), 'ptr', DllStructGetPtr ( $struct, 1 ), 'ptr', 0, 'ptr', 0 )
     If @error Or Not $a_Call[0] Then Return SetError ( 2, 0, '' )
     Return DllStructGetData ( $a, 1 )
EndFunc ;==> _Base64Decode ()