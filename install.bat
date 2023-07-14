@echo off
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

@(  Echo Set WshShell = WScript.CreateObject("WScript.Shell"^)
    Echo Set oShellLink = WshShell.CreateShortcut("%~dp0\VRCAudioToggle.lnk"^)
    Echo oShellLink.TargetPath = """%~dp0\script\run.bat"""
    Echo oShellLink.WindowStyle = 1
    Echo oShellLink.IconLocation = "%~dp0\Icon\VR-AUDIO-TOGGLE.ico, 0"
    Echo oShellLink.Description = "VR Audio Device Toggle, by WinterFe"
    Echo oShellLink.WorkingDirectory = "%~dp0"
    Echo oShellLink.Save) 1>"CreateShortcut.vbs"
@%SystemRoot%\System32\cscript.exe //NoLogo "CreateShortcut.vbs" && Del "CreateShortcut.vbs"