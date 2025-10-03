# Public Ip for the load balancer
resource "azurerm_public_ip" "my-public-ip" {
    name = "${var.resource_name}-lb-public-ip"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name
    allocation_method = "Static" # Or Dynamic - If static, IP remains same after recreation, dynamic - new IP is assigned
    domain_name_label = "${azurerm_resource_group.my-rg.name}"
    sku = "Standard"
    zones = ["1","2"]
}