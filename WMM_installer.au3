#cs------------------------------------------------------------------------------------
#	AutoIT version 3
#	Author: Reginald Sands


#	Script Function:
#		Unattended installation of Windows Movie Maker

#ce--------------------------------------------------------------------------------------

;Start Script

;Launch the windoews essensials installer
ShellExecute("C:\Users\rasands\Downloads\wlsetup-web.exe")

;Wait
WinWaitActive("[TITLE:Windows Essentials 2012; CLASS:LiveDialog]", "Choose the program you want to install", 60 )

;Click the "Choose the program you want to install
ControlClick("Windows Essentials 2012", "", "[CLASS:Button; TEXT:Choose the programs you want to install; INSTANCE:2]")




