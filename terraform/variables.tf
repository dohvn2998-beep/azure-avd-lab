variable "subscription_id" {
  description = "Azure subscription ID used by the lab."
  type        = string
  sensitive   = true
}

variable "location" {
  description = "Azure region for the lab."
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Resource group for the lab."
  type        = string
  default     = "rg-azure-avd-lab"
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "lab"
}
