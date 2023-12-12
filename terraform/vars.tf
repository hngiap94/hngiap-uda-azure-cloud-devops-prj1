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
  description = "Number of VM resources to create behind the load balancer"
  default     = 2
}