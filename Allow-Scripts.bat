@echo off & setlocal
#(https://github.com/insovs)
title [https://guns.lol/inso.vs] Enable PowerShell Scripts (Unrestricted Mode) + Unblocked Files.

:: Enables PowerShell execution in Unrestricted mode, disables UAC and
:: unblocks all files in the directory to avoid Windows restrictions.
:: Option to revert to default settings available (Restricted + UAC on).

:: Ask for Admin Privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (goto uacprompt) else (goto gotadmin)
:uacprompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" & echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
exit /B
:gotadmin
if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs"
pushd "%CD%" & CD /D "%~dp0" & cls
set insoptiZ=[91m&set insoptiG=[92m&set insoptiJ=[93m&set insoptiI=[94m&set insoptiW=[97m&set insoptiX=[90m
echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Enable PowerShell Scripts (Unrestricted Mode) + Unblocked Files.
echo %insoptiX%[%insoptiJ%!%insoptiX%]%insoptiW% UAC (user acc control) is also disabled to ensure script execution works for everyone.
echo. &echo %insoptiX%[%insoptiG%1%insoptiX%]%insoptiW% Allow Script. %insoptiX%(Unrestricted Mode + UAC off + Unblocked Files)%insoptiW%& echo %insoptiX%[%insoptiG%2%insoptiX%]%insoptiW% Revert default. %insoptiX%(Restricted Mode + UAC on)%insoptiW%& echo %insoptiX%[%insoptiG%3%insoptiX%]%insoptiW% %insoptiX%Exit.%insoptiW%& echo.
set /p choice=">> "
if "%choice%"=="1" goto enable
if "%choice%"=="2" goto revert
if "%choice%"=="3" goto end
echo %insoptiX%[%insoptiJ%/%insoptiX%]%insoptiW% Invalid choice. & timeout /t 2 >nul 2>&1 & goto gotadmin

:enable
cls
reg add "HKCR\Applications\powershell.exe\shell\open\command" /ve /t REG_SZ /d "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -ExecutionPolicy unrestricted -File \"%%1\"" /f >nul 2>&1
reg add "HKCU\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Unrestricted" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" /v EnableModuleLogging /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockInvocationLogging /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableTranscripting /t REG_DWORD /d 0 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul 2>&1
cd %~dp0
powershell -Command "Get-ChildItem -Path . -Recurse | Unblock-File"
echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Successfully enabled PowerShell script execution with Unrestricted Mode and unblocked files!
echo %insoptiX%[%insoptiG%?%insoptiX%]%insoptiW% Restart the computer to apply the changes? (%insoptiG%Y%insoptiW%/%insoptiZ%N%insoptiW%)
set /p restartChoice=">> "
if /i "%restartChoice%"=="y" (
    echo. & echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Restarting... & timeout /t 2 >nul 2>&1
    shutdown /r /t 0
) else (goto end)

:revert
cls
reg add "HKCU\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" /v "ExecutionPolicy" /t REG_SZ /d "Restricted" /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ModuleLogging" /v EnableModuleLogging /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockLogging /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" /v EnableScriptBlockInvocationLogging /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription" /v EnableTranscripting /t REG_DWORD /d 1 /f >nul 2>&1
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 1 /f >nul 2>&1
echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Restored default PowerShell ExecutionPolicy (Restricted) + UAC on.
echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Restart computer to apply the changes? (%insoptiG%Y%insoptiW%/%insoptiZ%N%insoptiW%)
set /p restartChoice=">> "
if /i "%restartChoice%"=="y" (
    echo.& echo %insoptiX%[%insoptiG%+%insoptiX%]%insoptiW% Restarting... & timeout /t 3 >nul 2>&1
    shutdown /r /t 0
) else (goto end)

:end
echo.& echo %insoptiX%[%insoptiZ%/%insoptiX%]%insoptiW% Exiting...
timeout /t 2 >nul 2>&1
endlocal & exit /B
#(https://github.com/insovs)

