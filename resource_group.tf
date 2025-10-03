resource "azurerm_resource_group" "my-rg" {
    name = "${var.resource_name}-rg"
    location = "${var.location}"
}