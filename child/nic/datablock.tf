data "azurerm_subnet" "subntedata" {
    for_each = var.nic
  name                 = each.value.subnetdataname
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
# data "azurerm_public_ip" "pipdata" {
#     for_each = var.nic
#   name                = each.value.pipdataname
#   resource_group_name = each.value.resource_group_name
# }

