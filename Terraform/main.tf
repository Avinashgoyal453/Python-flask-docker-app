provider "azurerm" {
  features {}
  subscription_id = "fbeeaed1-f074-4dc0-a3a5-eb74529a46e3"
}

resource "azurerm_resource_group" "exam_rg" {
  name     = "examResourceGroup"
  location = "East US"
}

resource "azurerm_virtual_network" "exam_vnet" {
  name                = "examVNet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.exam_rg.location
  resource_group_name = azurerm_resource_group.exam_rg.name
}

resource "azurerm_subnet" "exam_subnet" {
  name                 = "examSubnet"
  resource_group_name  = azurerm_resource_group.exam_rg.name
  virtual_network_name = azurerm_virtual_network.exam_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_container_registry" "acr" {
  name                = "acravinash1238"
  resource_group_name = azurerm_resource_group.exam_rg.name
  location            = azurerm_resource_group.exam_rg.location
  sku                 = "Basic"
  admin_enabled       = true
}
