#cs---------------------------------------------------------------------------------------------
#	AutoIT Version  3
#	Author: Reginald Sands


#	Script Function:
#		Unattended installation of Ninite


#ce---------------------------------------------------------------------------------------------

;Start Script

#RequireAdmin
; Start the SPSS installer
Run(@ScriptDir &"\SPSS_Statistics_25_win64.exe")
AutoItSetOption('MouseCoordMode', 0)

; Accept the SPSS License Materials
WinWait("IBM SPSS Statistics 25 - InstallShield Wizard", "")
WinActivate("IBM SPSS Statistics 25 - InstallShield Wizard", "Licensed Materials")
; Click the Next button
MouseClick("button", 1072, 695, 1, 0)

; Accept SLA
WinWait("IBM SPSS Statistics 25 - InstallShield Wizard", "Software License Agreement")
WinActivate("IBM SPSS Statistics 25 - InstallShield Wizard", "I &accept the terms in the license agreement.")
; Select the "I &accept the terms in the license agreement." radio button
MouseClick("button", 10, 269, 1, 0)

