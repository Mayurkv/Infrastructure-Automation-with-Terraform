resource "azurerm_monitor_autoscale_setting" "my_vmss_autoscale" {
    name = "${var.resource_name}-vmss-autoscale"
    location = azurerm_resource_group.my-rg.location
    resource_group_name = azurerm_resource_group.my-rg.name
    target_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id

    profile {
        name = "autoscale capacity 1"
        capacity {
            minimum = "1"
            maximum = "2"
            default = "1"
        }
        rule {
            metric_trigger {
                metric_name = "Percentage CPU"
                metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
                time_grain = "PT1M" # Get CPU usage % every 1 minute
                time_window = "PT5M" # Check last 5 minutes window. Statistics defined which aggregation to use for the usage.
                statistic = "Average" # Take Average of CPU % usage of the last 5 minutes for all VMs separately
                time_aggregation = "Average" # Takes average of all the VMs, (vm1+vm2)/2 -> average
                operator = "GreaterThan"
                threshold = "70"
            }
            scale_action {
                direction = "Increase"
                type = "ChangeCount"
                value = 1
                cooldown = "PT5M" # Wait for 5 minutes after the scaling is done to evaluate again
            }
        }
        rule {
            metric_trigger {
                metric_name = "Percentage CPU"
                metric_resource_id = azurerm_linux_virtual_machine_scale_set.vmss.id
                time_grain = "PT1M"
                time_window = "PT5M"
                statistic = "Average"
                time_aggregation = "Average"
                operator = "LessThan"
                threshold = "30"
            }
            scale_action {
                direction = "Decrease"
                type = "ChangeCount"
                value = 1
                cooldown = "PT2M"
            }
        }
    }
}