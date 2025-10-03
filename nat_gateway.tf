resource "azurerm_nat_gateway" "my_nat_gateway" {
    name = "${var.resource_name}-nat-gateway"
    resource_group_name = azurerm_resource_group.my-rg.name
    location = azurerm_resource_group.my-rg.location
    sku_name = "Standard"
    # idle_timeout_in_minutes = 10  --> Default value is 4
    zones = ["1"]
}