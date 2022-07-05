variable "ansible_override" {
  type    = string
  default = ""
}

variable "boot_command" {
}

variable "disk_size" {
  type    = string
  default = "70000"
}

variable "disk_additional_size" {
  type    = list(number)
  default = ["1024"]
}

variable "memory" {
  type    = string
  default = "4096"
}

variable "cpus" {
  type    = string
  default = "4"
}

variable "iso_checksum" {
  type    = string
  default = ""
}

variable "iso_checksum_type" {
  type    = string
  default = "none"
}

variable "iso_url" {
  type    = string
  default = ""
}

variable "output_directory" {
  type    = string
  default = ""
}

variable "provision_script_options" {
  type    = string
  default = ""
}

variable "output_vagrant" {
  type    = string
  default = ""
}

variable "ssh_password" {
  type    = string
  default = ""
  sensitive = true
}

variable "switch_name" {
  type    = string
  default = ""
}

variable "vagrantfile_template" {
  type    = string
  default = ""
}

variable "vlan_id" {
  type    = string
  default = ""
}

variable "vm_name" {
  type    = string
  default = ""
}

source "hyperv-iso" "vm" {
  boot_command          = "${var.boot_command}"
  boot_wait             = "1s"
  communicator          = "ssh"
  cpus                  = "${var.cpus}"
  disk_block_size       = "1"
  disk_size             = "${var.disk_size}"
  enable_dynamic_memory = "true"
  enable_secure_boot    = false
  generation            = 2
  guest_additions_mode  = "disable"
  http_directory        = "./extra/files/gen2-ubuntu2204"
  iso_checksum          = "${var.iso_checksum_type}:${var.iso_checksum}"
  iso_url               = "${var.iso_url}"
  memory                = "${var.memory}"
  output_directory      = "${var.output_directory}"
  shutdown_command      = "echo 'password' | sudo -S shutdown -P now"
  shutdown_timeout      = "30m"
  ssh_password          = "${var.ssh_password}"
  ssh_timeout           = "4h"
  ssh_username          = "ubuntu"
  switch_name           = "${var.switch_name}"
  temp_path             = "."
  vlan_id               = "${var.vlan_id}"
  vm_name               = "${var.vm_name}"
}

build {
  sources = ["source.hyperv-iso.vm"]

  provisioner "file" {
    destination = "/tmp/uefi.sh"
    source      = "extra/files/gen2-ubuntu2204/uefi.sh"
  }

  provisioner "file" {
    destination = "/tmp/provision.sh"
    source      = "extra/files/gen2-ubuntu2204/provision.sh"
  }


  provisioner "shell" {
    execute_command   = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    expect_disconnect = true
    inline            = ["chmod +x /tmp/provision.sh", "chmod +x /tmp/uefi.sh", "mv /tmp/uefi.sh /usr/local/bin/uefi.sh", "/tmp/provision.sh ${var.provision_script_options}"]
    inline_shebang    = "/bin/sh -x"
  }


  provisioner "shell" {
    execute_command = "chmod +x {{ .Path }}; {{ .Vars }} sudo -E sh '{{ .Path }}'"
    inline          = ["echo Last Phase",
    "chmod +x /usr/local/bin/uefi.sh",
    "/bin/rm -rfv /tmp/*",
    "/bin/rm -f /etc/ssh/*key*",
    "/usr/bin/ssh-keygen -A",
    "echo 'packerVersion: ${packer.version}' >>/etc/packerinfo"]
    inline_shebang  = "/bin/sh -x"
  }

}
