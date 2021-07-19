terraform {    
  required_providers {    
    azurerm = {    
      source = "hashicorp/azurerm"    
    }    
  }    
}    
provider "azurerm" {    
  features {}    
}    
resource "azurerm_resource_group" "terraformlab" {    
  name = "terraformlab"    
  location = "eastus"    
}
resource "azurerm_app_service_plan" "samplewebapp" {  
  name                = "samplewebapp"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.terraformlab.name  
  
  sku {  
    tier = "Standard"  
    size = "S1"  
  }  
}
resource "azurerm_app_service" "pythonapp" {  
  name                = "pythonapp"  
  location            = "eastus"  
  resource_group_name = azurerm_resource_group.terraformlab.name  
  app_service_plan_id = azurerm_app_service_plan.samplewebapp.id  
  
  app_settings = {  
    "DeviceName" = "SampleDevice",  
    "DeviceId" = "2"  
  }  
}