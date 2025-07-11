terraform {
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_app_service_plan" "deepcodr-firstplan" {
  name = "firstapp-plan"
  resource_group_name = "RG-CTB40-AZ-400-3"
  location = "westus"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "Khush-testapp" {
  name = "Khush-testapp"
  resource_group_name = "RG-CTB40-AZ-400-3"
  location = "westus"
  app_service_plan_id = azurerm_app_service_plan.deepcodr-firstplan.id

  site_config {
    python_version = "3.4"
    scm_type = "LocalGit"
  }
}

resource "azurerm_storage_account" "khushstoragetest" {
  name = "khushstoragetest"
  resource_group_name = "RG-CTB40-AZ-400-3"
  location = "westus"
  account_tier = "Standard"
  account_replication_type = "LRS"
}
