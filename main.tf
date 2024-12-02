terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.43.0"
    }
  }
  cloud {

    organization = "EVF_Consulting"

    workspaces {
      name = "Hands-on-With-Terraform-Azure-Evf"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "rg-terraform"
  location = "uksouth"
}

module "mysecurestorage" {
  source  = "app.terraform.io/EVF_Consulting/mysecurestorage/azurerm"
  version = "1.0.0"
  # insert required variables here
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  storage_account_name = "evf201storageaccount"

}
