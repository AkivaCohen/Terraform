variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default     = "tf"
}

variable "resource_group" {
  description = "The name of the resource group in which to create the virtual network."
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "address_space" {
  description = "The address space that is used by the virtual network. You can supply more than one address space. Changing this forces a new resource to be created."
  default     = ["10.0.0.0/16"]
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_D1_v2"
}

variable "admin_username" {
  description = "administrator user name"
  default     = "vmadmin"
}

# variable "admin_password" {
#   description = "administrator password (recommended to disable password auth)"
# }