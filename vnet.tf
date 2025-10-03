resource "azurerm_virtual_network" "my-vnet" {
    name = "${var.resource_name}-vnet"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name
    address_space = ["10.0.0.0/16"]

}