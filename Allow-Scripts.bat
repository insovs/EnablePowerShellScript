@echo off
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\adm.vbs"
    echo UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\adm.vbs"
    "%temp%\adm.vbs" & del "%temp%\adm.vbs" & exit /b
)

cls
echo  [1] Enable  - Unrestricted + UAC off + SAC off
echo  [2] Revert  - Restricted
echo  [3] Exit
echo.
set /p c=">> "

if "%c%"=="1" (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v ExecutionPolicy /t REG_SZ /d Unrestricted /f >nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v EnableScripts /t REG_DWORD /d 1 /f >nul
    reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v EnableLUA /t REG_DWORD /d 0 /f >nul
    reg add "HKLM\SYSTEM\CurrentControlSet\Control\CI\Policy" /v VerifiedAndReputablePolicyState /t REG_DWORD /d 0 /f >nul
    echo Done. Restart to apply.
) else if "%c%"=="2" (
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v ExecutionPolicy /t REG_SZ /d Restricted /f >nul
    reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\PowerShell" /v EnableScripts /t REG_DWORD /d 0 /f >nul
    echo Reverted. Restart to apply.
) else ( exit /b )

set /p r="Restart now? (Y/N) >> "
if /i "%r%"=="y" shutdown /r /t 0
