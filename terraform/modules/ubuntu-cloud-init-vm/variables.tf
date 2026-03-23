variable "vm_name" {
  type        = string
  description = "Name of the VM"
}

variable "target_node" {
  type        = string
  description = "Proxmox node where the VM will be created"
}

variable "template_name" {
  type        = string
  description = "Name of the Ubuntu template to clone from"
}

variable "memory" {
  type        = number
  description = "Amount of memory in MB"
  default     = 4096
}

variable "cores" {
  type        = number
  description = "Number of CPU cores"
  default     = 2
}

variable "sockets" {
  type        = number
  description = "Number of CPU sockets"
  default     = 1
}

variable "disk_size" {
  type        = string
  description = "Size of the boot disk"
  default     = "20G"
}

variable "ip_address" {
  type        = string
  description = "Static IP address for the VM"
}

variable "gateway_ip" {
  type        = string
  description = "Gateway IP address"
}

variable "network_bridge" {
  type        = string
  description = "Network bridge to connect to"
  default     = "vmbr0"
}

variable "cloud_init_snippet" {
  type        = string
  description = "Name of the cloud-init snippet file"
  default     = "management-vm-cloud-init.yml"
}

variable "disk_storage" {
  type        = string
  description = "Storage location for disks"
  default     = "local-lvm"
}

