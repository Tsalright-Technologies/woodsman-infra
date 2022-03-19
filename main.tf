terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 2.99"
    }
  }
  
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "rg" {
  name     = "woodsman-cafe-rg"
  location = "North Central US"
}

resource "azurerm_static_site" "site" {
  name                = "woodsman-cafe-site"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
}