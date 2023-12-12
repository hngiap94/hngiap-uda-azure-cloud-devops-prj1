variable "project" {
  type        = string
  description = "Name of project"
  default     = "hngiap-udacity-azure-cloud-devops-prj1"
}

variable "resource_group" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "The Azure region where resources are created"
}