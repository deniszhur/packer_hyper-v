Write-Output "Phase-5d [START] - Cleaning/zeroing/compacting"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# RDP enable
Write-Output "Phase-5d [INFO] RDP enable"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -Value 0

# Russian encoding
Write-Output "Phase-5d [INFO] Russian encoding"
Set-WinSystemLocale -SystemLocale ru-RU

# Share enable
Write-Output "Phase-5d [INFO] Share enable"
Get-NetFirewallrule | Where {$_.DisplayName -like 'File*'} | Enable-NetFirewallRule

# Enable ping
Write-Output "Phase-5d [INFO] Enable ping"
Set-NetFirewallRule -DisplayName "File and Printer Sharing (Echo Request - ICMPv4-In)" -enabled True

# Activation
Write-Output "Phase-5d [INFO] Activation"
slmgr.vbs /ipk VDYBN-27WPP-V4HQT-9VMD4-VMK7H
slmgr.vbs /skms kms.loli.best
slmgr.vbs /ato


# resetbase/thin winsxs
dism /online /cleanup-image /StartComponentCleanup /ResetBase
dism /online /cleanup-Image /SPSuperseded


Write-Output "Phase-5d [END]"
exit 0