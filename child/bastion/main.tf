resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = each.value.bastionipconfig
    subnet_id            = var.bastion_subnet_idy[each.value.bastion_subnet_x]
    public_ip_address_id = var.pip_idy[each.value.pip_x]
  }
}
