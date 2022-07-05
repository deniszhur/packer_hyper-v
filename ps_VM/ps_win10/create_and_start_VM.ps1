 $VMName = "test"

 $VM = @{
     Name = $VMName
     MemoryStartupBytes = 2147483648
     Generation = 1
     VHDPath = ".\output-hyperv-iso\Virtual Hard Disks\packer-demo.vhdx"
     BootDevice = "VHD"
     Path = "C:\Virtual Machines\$VMName"
     SwitchName = "internal_vSwitch"
 }

 New-VM @VM
 Start-VM -Name $VMName