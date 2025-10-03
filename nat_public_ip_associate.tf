resource "azurerm_nat_gateway_public_ip_association" "my_nat_public_ip_associate" {
    nat_gateway_id = azurerm_nat_gateway.my_nat_gateway.id
    public_ip_address_id = azurerm_public_ip.my_nat_public_ip.id
}