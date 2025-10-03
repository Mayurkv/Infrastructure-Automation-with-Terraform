resource "azurerm_subnet" "my-subnet" {
    name = "${var.resource_name}-subnet"
    resource_group_name = azurerm_resource_group.my-rg.name
    virtual_network_name = azurerm_virtual_network.my-vnet.name
    address_prefixes = ["10.0.0.0/24"]
}