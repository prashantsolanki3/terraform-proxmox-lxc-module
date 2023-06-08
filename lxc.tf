resource "proxmox_lxc" "container" {

  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.template
  unprivileged = var.unprivileged
  ostype       = var.ostype
  cores       = var.cpu_count
  description = var.description
  memory      = var.memory
  start       = true


  ssh_public_keys = <<EOF
  ${file(var.public_key_file)}
  EOF

  features {
    fuse    = true
    nesting = true
    mount   = "nfs;cifs"
  }

  // Terraform will crash without rootfs defined
  rootfs {
    storage = var.disk_storage
    size    = var.disk_size
  }

  // Bind Mount Point
  mountpoint {
    key     = "1"
    slot    = 1
    storage = "/slow-pool/home/${var.hostname}"
    // Without 'volume' defined, Proxmox will try to create a volume with
    // the value of 'storage' + : + 'size' (without the trailing G) - e.g.
    // "/srv/host/bind-mount-point:256".
    // This behaviour looks to be caused by a bug in the provider.
    volume  = "/slow-pool/home/${var.hostname}"
    mp      = "/home"
    size    = "16G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "${var.ipv4}/24"
    gw     = "${var.ipv4_gateway}"
  }

  network {
    name   = "eth1"
    bridge = "vmbr1"
    ip     = "${var.ipv4_data}/24"
  }
}