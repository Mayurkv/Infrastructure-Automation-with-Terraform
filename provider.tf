terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~> 4.5.0"
    }
  }
  required_version = "=1.13.3"
}

provider "azurerm" {
  features {

  }
}