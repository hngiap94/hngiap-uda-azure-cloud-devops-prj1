variable "project" {
  type        = string
  description = "Name of project"
  default     = "hngiap-udacity-azure-cloud-devops-prj1"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
  default     = "Azuredevops"
}

variable "location" {
  type        = string
  description = "The Azure region where resources are created"
  default     = "East US"
}

variable "vm_count" {
  type        = number
  description = "Number of virtual machine"
  default     = 2
}

variable "vm_size" {
  type        = string
  description = "Size of virtual machine"
  default     = "Standard_B1s"
}

variable "vm_username" {
  type        = string
  description = "Username of virtual machine"
}

variable "vm_password" {
  type        = string
  description = "Password of virtual machine"
}