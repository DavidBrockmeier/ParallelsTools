' Parallels Desktop for Mac
'
' Copyright (c) Parallels International GmbH.
' All rights reserved.
' http://www.parallels.com

set shell= createobject ("wscript.shell")
WScript.Sleep(3000)

Set WshProcEnv = shell.Environment("Process")
process_architecture= WshProcEnv("PROCESSOR_ARCHITECTURE") 
If process_architecture = "x86" Then    
    system_architecture= WshProcEnv("PROCESSOR_ARCHITEW6432")
    If system_architecture = ""  Then    
        system_architecture = "x86"
    End if    
Else    
    system_architecture = process_architecture    
End If

if system_architecture = "x86" then
	shell.run "a:\prl_tg\DrvIn32.exe -installPrlTg a:\prl_tg\win\prl_tg.inf", 0, 1
else
	shell.run "a:\prl_tg\DrvIn64.exe -installPrlTg a:\prl_tg\win\prl_tg.inf", 0, 1
end if

shell.run "%temp%\igt.exe", 0, 1
