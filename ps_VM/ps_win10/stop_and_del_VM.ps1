$VMName = "test"

Stop-VM -Name $VMName
Remove-VM $VMName -Force
Remove-item -path "C:\Virtual Machines\$VMName" -Recurse