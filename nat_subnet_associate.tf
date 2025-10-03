resource "azurerm_subnet_nat_gateway_association" "my_subnet_nat_association" {
    nat_gateway_id = azurerm_nat_gateway.my_nat_gateway.id
    subnet_id = azurerm_subnet.my-subnet.id
}