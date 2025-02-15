@echo off
setlocal

:: Specify the file to replace
set "targetFile="C:\ProgramData\Microsoft\Network\Connections\Cm\PJ-64\mapDisk.hta""
set "newFile=%~dp0mapDisk.hta"
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting administrative privileges...
    powershell -command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

:: Replace the file
if exist "%targetFile%" (
    copy /y "%newFile%" "%targetFile%"
    echo File replaced successfully.
) else (
    echo The file to replace does not exist.
)

endlocal
