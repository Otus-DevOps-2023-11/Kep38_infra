variable "cloud_id" {
  description = "Cloud ID"
}

variable "folder_id" {
  description = "Folder ID"
}

variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "image_id" {
  description = "Disk image ID"
}

variable "subnet_id" {
  description = "Subnet ID"
}

variable "service_account_key_file" {
  description = "Path to the service account key file (.json)"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "region_id" {
  description = "Region ID"
  default     = "ru-central1"
}

