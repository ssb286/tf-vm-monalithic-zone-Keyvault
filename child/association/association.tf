

resource "azurerm_network_interface_security_group_association" "association" {

  for_each = var.association

  network_interface_id = var.nic_idy[each.value.nicx]

  network_security_group_id = var.nsg_idy[each.value.nsgx]

}