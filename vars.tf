variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "udacity-project"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created"
  default = "East US"
}

variable "username" {
  description = "The username for VM."
  default = "AzureUser"
}

variable "password" {
  description = "The password for VM."
  default = "Udacity@1234"
}

variable "number_of_vms" {
  description = "Number of VMs"
  type        = number
  default     = 3
}