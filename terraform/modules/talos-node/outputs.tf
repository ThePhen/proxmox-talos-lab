output "vm_id" {
  description = "ID of the created VM"
  value       = proxmox_vm_qemu.talos_node.vmid
}

output "vm_name" {
  description = "Name of the created VM"
  value       = proxmox_vm_qemu.talos_node.name
}

output "vm_ipv4_address" {
  description = "IPv4 address of the VM (DHCP assigned)"
  value       = proxmox_vm_qemu.talos_node.default_ipv4_address
}

output "vm_network_interfaces" {
  description = "Network interface configuration"
  value       = proxmox_vm_qemu.talos_node.network
}

