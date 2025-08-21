# ========================
# VM Related Variables
# ========================
variable "agent_vm_name" {
  description = "Name of the Azure VM"
  type        = string
}

variable "location" {
  description = "Azure location/region where resources will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name in which to deploy resources"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the VM"
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Size of the VM (e.g. Standard_B2s)"
  type        = string
}

# ========================
# Azure Provider Variables
# ========================
variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "client_id" {
  description = "Azure Client ID (Service Principal App ID)"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret (Service Principal Password)"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}
