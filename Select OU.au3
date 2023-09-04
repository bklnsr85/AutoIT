#include <GUIConstantsEx.au3>
#include <Array.au3>
Opt("GuiOnEventMode", 1)

; Declared Varibles
$hOU = ""

; Here is the array
Global $aArray[16][2] = [["Computer Systems", "Computer Systems"], ["BMH.Front", "BMH.Front"], ["BMH.Back", "BMH.Back"], ["ICA-1", "ICA-1"], ["ICA-2", "ICA-2"], ["ICA-3", "ICA-3"], ["ICA-4", "ICA-4"], ["WSBLAB", "Wood Science 107"], ["MRLAB", "Midrise Honors"], ["CSHLAB", "C Smith 302"], ["LSHLAB", "Lee Smith"], ["SSTLAB", "Spartan Suites"], ["TTNLAB", "TwinTowers N 111"], ["TTSLAB", "TwinTowners S 110"], ["RAHLAB", "Rosa"], ["SSHLAB", "Scott 103"]]

; And here we get the element into a list
$sList = ""
For $i = 0 To UBound($aArray,1) -1
	$sList &= "|" & $aArray[$i][0]
Next


; **Create a GUI

; Create a Window - GUICreate("title", width, height)
$hGUI = GUICreate("Select OU", 220, 130)

; Create the Drop-down menu - GUICtrlCreateCombo("text", left, top, width, height)
$hCombo = GUICtrlCreateCombo("", 20, 60, 150, 20)

; And fill it - GUICtrlSetData(controlID, data)
GUICtrlSetData($hCombo, $sList)

; Create Label - GUICtrlCreateLabel("text", left, top, width, height)
$hLabel = GUICtrlCreateLabel("Select the OU you want to Join:", 20, 15, 160, 30)

; Create OK button - GUICtrlCreateButton("text", left, top, width, height)
$Button = GUICtrlCreateButton ("OK", 75, 85, 60, 30)
GUICtrlSetOnEvent($Button, "OKPressed")

; Changes the state of the GUI window
GUISetState()

;End of GUI creation
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
		Case $hCombo
			$sName = GUICtrlRead($hCombo)
			$iIndex = _ArraySearch($aArray, $sName)
			If Not @error Then
				GUICtrlSetData($hLabel, $aArray[$iIndex][1])
			EndIf
	EndSwitch
WEnd

; Function to send a message boxs after the OK button is pressed.
Func OKPressed()
	MsgBox(4096, "", $hOU)
EndFunc