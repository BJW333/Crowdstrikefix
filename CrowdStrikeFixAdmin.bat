@echo off

NET SESSION >nul 2>&1
if %errorLevel% == 0 (
    goto :run
) else (
    goto :UACPrompt
)

:UACPrompt
echo Set UAC = CreateObject("Shell.Application") > "%temp%\getadmin.vbs"
echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B

:run
cd C:\Windows\System32\drivers\CrowdStrike
del C-00000291*.sys
shutdown /r /t 0
