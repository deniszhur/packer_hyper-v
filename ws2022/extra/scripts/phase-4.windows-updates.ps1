Write-Output "Phase-4 [START] - Updates"

Install-PackageProvider -Name NuGet -Force
Install-Module -Name PSWindowsUpdate -Force
Import-Module -Name PSWindowsUpdate -Force
Install-WindowsUpdate -Install -AcceptAll -ForceDownload -ForceInstall -IgnoreReboot -ErrorAction SilentlyContinue

Write-Output "Phase-4 [END] - Updates"
exit 0
