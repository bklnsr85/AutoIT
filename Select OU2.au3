	#include <ComboConstants.au3>
#include <GUIConstantsEx.au3>
#include <WindowsConstants.au3>
#include <Array.au3>
#include <String.au3>
#include 'WM_COPYDATA.au3'

Global $aArray[16][2] = [["Computer Systems", "Computer Systems"], ["BMH.Front", "BMH.Front"], ["BMH.Back", "BMH.Back"], ["ICA-1", "ICA-1"], ["ICA-2", "ICA-2"], ["ICA-3", "ICA-3"], ["ICA-4", "ICA-4"], ["WSBLAB", "Wood Science 107"], ["MRLAB", "Midrise Honors"], ["CSHLAB", "C Smith 302"], ["LSHLAB", "Lee Smith"], ["SSTLAB", "Spartan Suites"], ["TTNLAB", "TwinTowers N 111"], ["TTSLAB", "TwinTowners S 110"], ["RAHLAB", "Rosa"], ["SSHLAB", "Scott 103"]]



Global $hList = ""

For $i = 0 to 15
	$hList &= "|" & $aArray[$i][0]
Next

#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("Domain Join", 249, 150, 192, 124)
$Combo1 = GUICtrlCreateCombo("Combo1", 24, 48, 145, 25, BitOR($CBS_DROPDOWN,$CBS_AUTOHSCROLL))
GUICtrlSetData($Combo1, $hList)
$Button1 = GUICtrlCreateButton("OK", 72, 96, 75, 25)
$Label1 = GUICtrlCreateLabel("Select the OU you want to Join:", 24, 16, 154, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit

		Case $Combo1
			$OUSelect = GUICtrlRead($Combo1)
			$iIndex = _ArraySearch($aArray, $OUSelect)
			$hOU = $aArray[$iIndex][1]
		Case $Button1
			MsgBox(4096, "", $hOU)
			Exit
	EndSwitch
WEnd
