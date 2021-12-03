variable "common_tags" {
  description = "Common Tags"
  type        = map(string)
}

variable "yaml_path" {
  description = "path to yaml config file"
}

variable "location" {
  description = "location to deploy resources to"
}

variable "vnet_rg" {
  description = "Name of the virtual Network resource group"
}

