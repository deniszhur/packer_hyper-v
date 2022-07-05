 $VMName = "test"
 $VHDPath = "E:\packer-demo.vhdx"
 $SwitchName = "Intel(R) 82574L Gigabit Network Connection - Virtual Switch"

 $VM = @{
     Name = $VMName
     MemoryStartupBytes = 1147483648
     Generation = 1
     VHDPath = $VHDPath
     BootDevice = "VHD"
     Path = "E:\Virtual Machines\$VMName"
     SwitchName = $SwitchName
 }

 New-VM @VM
 Start-VM -Name $VMName
 Add-ClusterVirtualMachineRole -VirtualMachine $VMName