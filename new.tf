terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.54.0"
    }
  }
}

provider "azurerm" {
    subscription_id = "254fc39b-c667-436b-80a7-f0dc7038e484"

     features {
      resource_group {
         prevent_deletion_if_contains_resources = false
      }
     }
  # Configuration options
}


module "rg" {
  source = "./rg"
  
}

module "vnet" {
  source = "./vnet"
  depends_on = [ module.rg ]
  rg_name = module.rg.rg_name
  
}

module "vm" {
  source = "./vm"
  depends_on = [ module.vnet ]
  rg_name = module.rg.rg_name
  subnet_id = module.vnet.subnet_id
}