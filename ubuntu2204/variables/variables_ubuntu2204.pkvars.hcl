iso_url="ubuntu-22.04-live-server-amd64.iso"
iso_checksum_type="sha256"
iso_checksum="84aeaf7823c8c61baa0ae862d0a06b03409394800000b3235854a6b38eb4856f"
vm_name="packer-ubuntu2204-g2"
disk_size="70000"
disk_additional_size=["150000"]
switch_name="Default Switch"
output_directory="output-ubuntu2204"
output_vagrant="./vbox/packer-ubuntu2204-g2.box"
vlan_id=""
vagrantfile_template="./vagrant/hv_ubuntu2204_g2.template"
ssh_password="password"
provision_script_options="-z false"
boot_command=["<esc>c<wait3>","linux /casper/vmlinuz quiet autoinstall net.ifnames=0 biosdevname=0 ip=dhcp ipv6.disable=1 ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ <enter>","initrd /casper/initrd <enter>","boot <enter>"]
