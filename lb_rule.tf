# The frontend port tells the Load Balancer which port to listen on for incoming traffic. Using LB rules, traffic arriving on different frontend ports can be routed to different backend pools or VMSS instances, enabling multiple applications to share the same Load Balancer.
resource "azurerm_lb_rule" "my-lb-rule" {
    name = "http"
    frontend_port = 80 # LB listens here
    backend_port = 80 # Traffic sent to the port of the VM instance
    protocol = "Tcp"
    frontend_ip_configuration_name = "${var.resource_name}-public-frontend"
    loadbalancer_id = azurerm_lb.my-lb.id
    backend_address_pool_ids = [azurerm_lb_backend_address_pool.my-lb-backend-pool.id] # The backend pool id creaed for the LB
}