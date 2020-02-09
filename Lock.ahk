#SingleInstance

if not A_IsAdmin
{
  Run *RunAs "%A_ScriptFullPath%"
  ExitApp
}

FileInstall, Lock.ps1, C:\Windows\Temp\Lock.ps1, 1
#w::Run PowerShell -File C:\Windows\Temp\Lock.ps1,,Hide
