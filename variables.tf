variable "unprivileged" {
  type    = bool
  default = false
}

variable "description" {
  type    = string
  default = "Terraform Proxmox LXC Container"
}

variable "target_node" {
  description = "TARGET_NODE"
  type        = string
}

variable "public_key_file" {
  description = "public_key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "template" {
  description = "Template Name"
  type        = string
  default     = "local:vztmpl/ubuntu-20.04-standard_20.04-1_amd64.tar.gz"
}

variable "ostype" {
  description = "OS Type"
  type        = string
  default     = "ubuntu"
}

variable "cpu_count" {
  description = "cpu_count"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory"
  type        = number
  default     = 4096
}

variable "hostname" {
  description = "Hostname"
  type        = string
  default     = "lxc-template"
}

variable "ipv4_gateway" {
  description = "Default Gateway"
  type        = string
}

variable "ipv4" {
  description = "The ipv4"
  type        = string
  default     = "10.2.21.12"
}

variable "ipv4_data" {
  description = "The ipv4 data network"
  type        = string
  default     = "10.2.21.12"
}

variable "disk_size" {
  description = "Disk size"
  type        = string
  default     = "16G"
}

variable "disk_storage" {
  description = "storage location"
  type        = string
  default     = "local-lvm"
}
