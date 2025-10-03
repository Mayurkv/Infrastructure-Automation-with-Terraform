resource "azurerm_public_ip" "my_nat_public_ip" {
    name = "${var.resource_name}-my-nat-gateway-public-ip"
    resource_group_name = azurerm_resource_group.my-rg.name
    location = azurerm_resource_group.my-rg.location
    sku = "Standard"
    allocation_method = "Static"
    zones = ["1"]
}