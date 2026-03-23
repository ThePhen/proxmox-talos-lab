# terraform/modules/talos-node/main.tf
terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
}

resource "proxmox_vm_qemu" "talos_node" {
  name        = var.node_prefix
  target_node = var.target_node
  clone       = var.template_name
  full_clone  = true
  boot        = "c"
  bootdisk    = "scsi0"

  # Storage Configuration
  disk {
    slot    = "scsi0"
    type    = "disk"
    storage = "local-lvm"
    size    = "20G"
    discard = true
  }

  # Talos Installation ISO
  disk {
    slot = "ide2"
    type = "cdrom"
    iso  = "local:iso/talos-metal_1.12.6-amd64.iso"
  }

  # VM Configuration
  os_type = "cloud-init"
  ciuser  = "talos"
  memory  = var.memory
  scsihw  = "virtio-scsi-pci"
  agent   = 0
  start_at_node_boot  = true

  # CPU Configuration
  cpu {
    type    = "host"
    cores   = var.cores
    sockets = var.sockets
  }

  # Network Configuration
  network {
    id     = 0
    model  = "virtio"
    bridge = var.network_bridge
  }
}

