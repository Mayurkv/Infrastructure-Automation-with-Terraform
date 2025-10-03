resource "azurerm_subnet_network_security_group_association" "subnet-nsg-associate" {
    subnet_id = azurerm_subnet.my-subnet.id
    network_security_group_id = azurerm_network_security_group.my-nsg.id
}