#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include 'WM_COPYDATA.au3'

Global Const $WM_COPYDATA = 0x004

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Form1", 219, 92, 192, 124)
$Input1 = GUICtrlCreateInput("", 16, 32, 185, 21)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

	EndSwitch
WEnd
