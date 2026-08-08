output "nsg_ka_parent_op" {
  value = module.nsg.nsg_id_child
}

output "nuic_ka_parent_op" {
  value = module.nic.nic_id_child
}

output "pip_ka_parent_op" {
  value = module.pip.pip_id
}

output "subnet_bastion" {
  value = module.subnet.subnet_id
}

# output "subnet_name" {
#   value = module.subnet.subnet_name
# }