terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

# Create a virtual network within the resource group
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  address_space       = ["10.0.0.0/16"]
}

module "tier1" {
  source = "./3-Tier-Application/Tier1"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  
}
  
module "tier2" {
  source = "./3-Tier-Application/Tier2"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  
}

module "tier3" {
  source = "./3-Tier-Application/Tier3"
  resource_group_name = azurerm_resource_group.example.name
  location = azurerm_resource_group.example.location
  
}