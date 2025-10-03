output resource-group-name {
    value = azurerm_resource_group.my-rg.name
    description = "Resource group name"
}

output lb-public-ip {
    value = azurerm_public_ip.my-public-ip.ip_address
    description = "Public IP of the load balancer"
}