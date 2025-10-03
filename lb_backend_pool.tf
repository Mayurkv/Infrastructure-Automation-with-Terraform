resource "azurerm_lb_backend_address_pool" "my-lb-backend-pool" {
    name = "${var.resource_name}-lb-backend-pool"
    loadbalancer_id = azurerm_lb.my-lb.id
}