#include <GUIConstantsEx.au3>
#include <Array.au3>

; Here is the array
Global $aArray[6][2] = [["ICA-1", "ICA "], ["ICA-2", "Swimming"], ["ICA-3", "Tennis"], ["ICA-4", "Basketball"], ["BMH-LAB", "Hockey"], ["WSB-LAB", "Wood Science"]]

; And here we get the elements into a list
$sList = ""
For $i = 0 To UBound($aArray,1) -1
    $sList &= "|" & $aArray[$i][0]
Next

; Create a GUI
#include <GUIConstantsEx.au3>

$hGUI = GUICreate("Auto Domain Join", 300, 90)

; Create the combo
$hCombo = GUICtrlCreateCombo("Select Domain OU", 20, 10, 200, 20)
; And fill it
GUICtrlSetData($hCombo, $sList)

; Create label
$hLabel = GUICtrlCreateLabel("eeeeee", 220, 15, 200, 20)

GUISetState()
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