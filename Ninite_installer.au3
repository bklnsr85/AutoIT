#cs---------------------------------------------------------------------------------------------
#	AutoIT Version  3
#	Author: Reginald Sands


#	Script Function:
#		Unattended installation of Ninite


#ce---------------------------------------------------------------------------------------------

;Start Script

#RequireAdmin
Run(@ScriptDir &"C:\Users\rasands\Downloads\Ninite_Installer_ait")
WinWait("Ninite", "Finished")
WinActivate("Ninite", "Close")
ControlClick("Ninite", "Close", 2)