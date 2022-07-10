Building images via a packer on hyper-v

requirements:
- original iso
- install hyper-v

images:
- CentOS-7-x86_64-Minimal-1611.iso 
https://mirror.nsc.liu.se/centos-store/7.3.1611/isos/x86_64/CentOS-7-x86_64-Minimal-1611.iso
- ubuntu-20.04.4-live-server-amd64.iso
https://releases.ubuntu.com/20.04/ubuntu-20.04.4-live-server-amd64.iso
- ubuntu-22.04-live-server-amd64.iso
https://releases.ubuntu.com/releases/22.04/ubuntu-22.04-live-server-amd64.iso
- SERVER_EVAL_x64FRE_en-us.iso
https://go.microsoft.com/fwlink/p/?LinkID=2195280&clcid=0x409&culture=en-us&country=US

build:
1. Put the original image in the required folder
2. Run script or run packer build with administrator rights in powershell
