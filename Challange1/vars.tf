variable "resourcegroup" {
  description = "Name of the resourcegroup"
  default = "Resourse_Group"
}

variable "location" {
  description = "Azure location to use"
  default = "Easrt US 1"
}

variable "vnet" {
  description = "Name of the vnet"
  default = "DemoVnet"
}

variable "vnet_address_space" {
  description = "Address space of vnet"
  default = ["10.0.0.0/16"]
}
