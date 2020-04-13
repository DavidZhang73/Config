Import-Module posh-git
Import-Module oh-my-posh
Import-Module z
Set-Theme MyTheme
Set-Alias -Name which -Value Get-Command
Set-Alias -Name exp -Value explorer.exe
Set-Alias -Name edge -Value "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
function mkdir { New-Item "$args" -ItemType Directory }
try { $null = Get-Command concfg -ea stop; concfg tokencolor -n enable } catch { }

Import-Module 'E:\Lang\cpp\vcpkg\scripts\posh-vcpkg'
