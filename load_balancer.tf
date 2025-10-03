resource "azurerm_lb" "my-lb" {
    name = "${var.resource_name}-lb"
    resource_group_name = azurerm_resource_group.my-rg.name
    location = azurerm_resource_group.my-rg.location
    sku = "Standard"

    # How the Lb receives incoming traffic
    # If public ip - internet facing
    # If sunet + private IP - internal LB (not accessible on the internet)
    frontend_ip_configuration {
        name = "${var.resource_name}-public-frontend"
        public_ip_address_id = azurerm_public_ip.my-public-ip.id
    }
}