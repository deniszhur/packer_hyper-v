$VMName = "test"

Stop-VM -Name $VMName
Remove-VM $VMName -Force
Remove-item -path "E:\Virtual Machines\$VMName" -Recurse