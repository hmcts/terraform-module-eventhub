variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}

variable "product" {
  description = "project group name"
}

variable "location" {
  description = "location to deploy resources to"
}

variable "vnet_rg" {
  description = "Name of the virtual Network resource group"
}

