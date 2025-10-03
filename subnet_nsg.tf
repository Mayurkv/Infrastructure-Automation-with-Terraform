resource "azurerm_network_security_group" "my-nsg" {
    name = "${var.resource_name}-subnet-nsg"
    location = var.location
    resource_group_name = azurerm_resource_group.my-rg.name

    security_rule {
        name                       = "allow-http-only-from-lb"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "AzureLoadBalancer"
        source_port_range          = "*"
        destination_address_prefix = "10.0.0.0/24"  # Only the VMSS subnet IPs
        destination_port_range     = "80"
    }

    security_rule {
        name                       = "allow-https-only-from-lb"
        priority                   = 101
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "AzureLoadBalancer"
        source_port_range          = "*"
        destination_address_prefix = "10.0.0.0/24"  # Only the VMSS subnet IPs
        destination_port_range     = "443"
    }

    security_rule {
        name                       = "allow-ssh-only-from-bastion"
        priority                   = 102
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_address_prefix      = "AzureBastion"
        source_port_range          = "*"
        destination_address_prefix = "10.0.0.0/24"  # Only the VMSS subnet IPs
        destination_port_range     = "22"
    }
    security_rule {
        name = "allow-all-outbound"
        priority = 200
        direction = "Outbound"
        access = "Allow"
        protocol = "*"
        source_address_prefix = "*" # Request from all the IP addresses are allowed" 
        source_port_range = "*" # All ports of the source are allowed
        destination_address_prefix = "*" # Request to any IP addresses in the subnet is allowed"
        destination_port_range = "*"
    }
}