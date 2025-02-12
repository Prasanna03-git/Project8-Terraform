terraform{
    required_providers {
      azurerm = {
        source  ="hashicorp/azurerm"
        version ="~> 4.18.0"
      }
    }
}
provider "azurerm" {
  client_id       = "7c57baae-04c2-4a84-aabb-6eb2e0864265"
  client_secret   = "2zL8Q~7cSWkA2J6ThS3t6db3bBq1B~qkTQibUakp"
  tenant_id       = "a922897c-f8f9-429e-8fbf-dd631e8496f4"
  subscription_id = "273dd228-606e-4083-a293-3c6b8d7062bd"
    features{

    }
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "feb112025terraformsa"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}
