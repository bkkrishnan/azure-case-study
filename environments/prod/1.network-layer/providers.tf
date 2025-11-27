terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
    azuread = {
      source = "hashicorp/azuread"
      version = "3.7.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  subscription_id = "aafc5fbe-2f4a-411b-b9fe-5dc54dbf5ff5"
  features {
    
  }
}