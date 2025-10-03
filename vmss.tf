resource "azurerm_linux_virtual_machine_scale_set" "vmss" {
    name = "${var.resource_name}-vmss"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name
    instances = 1
    sku = "Standard_D2s_v4"
    admin_username = "adminuser"

    os_disk {
        caching = "None"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }

    custom_data = base64encode(file("${path.module}/cloud_init.sh"))

    # Defines a NIC for the VMSS
    network_interface {
        name = "${var.resource_name}-network-interface"
        primary = true
        # Configuration for how the IP address is assigned to the VMs
        ip_configuration {
            name = "${var.resource_name}-ip-config"
            subnet_id = azurerm_subnet.my-subnet.id
            load_balancer_backend_address_pool_ids = [azurerm_lb_backend_address_pool.my-lb-backend-pool.id]
        }
    }
    # Creates this linux user and stores the public key in ~/.ssh/authorized_keys
    admin_ssh_key {
        username = "adminuser"
        public_key = tls_private_key.ssh_key.public_key_openssh
    }

    # If changes are made to the vm from the portal or somewhere else, do not recreate the VMSS
    lifecycle {
      ignore_changes = [ 
        instances
       ]
    }
}