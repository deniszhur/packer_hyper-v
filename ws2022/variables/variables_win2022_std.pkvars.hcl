iso_url="SERVER_EVAL_x64FRE_en-us.iso"
iso_checksum_type="sha256"
iso_checksum="3e4fa6d8507b554856fc9ca6079cc402df11a8b79344871669f0251535255325"
switch_name="Default Switch"
vlan_id=""
vm_name="packer-windows2022-g2"
disk_size="80000"
output_directory="output-windows-2022-g2"
secondary_iso_image="./extra/files/gen2-2022/std/secondary.iso"
output_vagrant="./vbox/packer-windows-2022-std-g2.box"
vagrantfile_template="./vagrant/hv_win2022_std.template"
sysprep_unattended="./extra/files/gen2-2022/std/unattend.xml"
vagrant_sysprep_unattended="./extra/files/gen2-2022/std/unattend_vagrant.xml"
upgrade_timeout="240"