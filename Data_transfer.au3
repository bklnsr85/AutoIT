#Include <GUIConstantsEx.au3>

Opt('WinTitleMatchMode', 3)

global const $TITLE_SENDER = '#Sender'
global const $TITLE_RECEIVER = '#Receiver'
global const $WM_COPYDATA = 0x004A

global $sMsg, $Dummy, $Flag = 0

if WinExists($TITLE_RECEIVER) then
    if WinExists($TITLE_SENDER) then
        exit
    endif
    _Sender()
else
    _Receiver()
endif

func _Sender()

    local $Input, $Button, $ID

    GUICreate($TITLE_SENDER, 400, 100)
    $Input = GUICtrlCreateinput('', 20, 20, 360, 20)
    $Button = GUICtrlCreateButton('Send', 165, 60, 70, 23)
    $Dummy = GUICtrlCreateDummy()
    GUIRegisterMsg($WM_COPYDATA, '_WM_COPYDATA')
    GUISetState()

    while 1
        $ID = GUIGetMsg()
        switch $ID
            case 0
                continueloop
            case $GUI_EVENT_CLOSE
                _SendData(WinGetHandle($TITLE_RECEIVER), '@exit')
                exitloop
            case $Button
                $sMsg = GUICtrlRead($Input)
                $hWnd = WinGetHandle($TITLE_RECEIVER)
                if (not @error) and ($sMsg > '') then
                    if _SendData($hWnd, $sMsg) then
                        GUICtrlSetState($Button, $GUI_DISABLE)
                    endif
                endif
            case $Dummy
                GUICtrlSetState($Button, $GUI_ENABLE)
        endswitch
    wend

    GUIDelete()
endfunc

func _Receiver()
    GUICreate($TITLE_RECEIVER)
    GUIRegisterMsg($WM_COPYDATA, '_WM_COPYDATA')

    while 1
        Sleep(10)
        if $Flag then
            if $sMsg = '@exit' then
                exitloop
            endif
            $Flag = 0
            _DoSomething($sMsg)
            _SendData(WinGetHandle($TITLE_SENDER), '')
        endif
    wend

    GUIDelete()
endfunc; _Receiver

func _DoSomething($sData)
    MsgBox(0, 'Message', $sData)
endfunc; _DoSomething

func _SendData($hWnd, $sData)

    local $tCOPYDATA, $tMsg

    $tMsg = DllStructCreate('char[' & StringLen($sData) + 1 & ']')
    DllStructSetData($tMsg, 1, $sData)
    $tCOPYDATA = DllStructCreate('dword;dword;ptr')
    DllStructSetData($tCOPYDATA, 2, StringLen($sData) + 1)
    DllStructSetData($tCOPYDATA, 3, DllStructGetPtr($tMsg))
    $Ret = DllCall('user32.dll', 'lparam', 'SendMessage', 'hwnd', $hWnd, 'int', $WM_COPYDATA, 'wparam', 0, 'lparam', DllStructGetPtr($tCOPYDATA))
    if (@error) or ($Ret[0] = -1) then
        return 0
    endif
    return 1
endfunc; _SendData

func _WM_COPYDATA($hWnd, $msgID, $wParam, $lParam)

    local $tCOPYDATA = DllStructCreate('dword;dword;ptr', $lParam)
    local $tMsg = DllStructCreate('char[' & DllStructGetData($tCOPYDATA, 2) & ']', DllStructGetData($tCOPYDATA, 3))

    $sMsg = DllStructGetData($tMsg, 1)

; For Sender
    GUICtrlSendToDummy($Dummy)

; For Receiver
    $Flag = 1

    return 0
endfunc; _WM_COPYDATA