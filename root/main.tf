
module "rg" {
  source = "../child/RG"
  rg = var.rg
}

module "vnet" {
  source = "../child/vnet"
  vnet = var.vnet
  depends_on = [ module.rg ]
}

module "subnet" {
  depends_on = [ module.vnet ]
source = "../child/subnet"
subnet = var.subnet
}
module "pip" {
  depends_on = [ module.rg ]
  source = "../child/pip"
  pip=var.pip
}
module "nsg" {
  source = "../child/nsg"
  depends_on = [ module.rg ]
  nsg=var.nsg
}

module "nic" {
  source = "../child/nic"
  depends_on = [ module.subnet,module.pip ]
  nic = var.nic
}

module "association" {

  source = "../child/association"

  association = var.association

  nic_idy = module.nic.nic_id_child

  nsg_idy = module.nsg.nsg_id_child

}

module "vms"{
  depends_on = [ module.nic]
  source = "../child/vl_lx"
  vms=var.vms
    nic_idy = module.nic.nic_id_child
}
module "bastion" {
  depends_on = [ module.nic,module.subnet ]
  source = "../child/bastion"
  bastion = var.bastion
  pip_idy = module.pip.pip_id
  bastion_subnet_idy = module.subnet.subnet_id
}

module "keyvault" {
  depends_on = [ module.rg ]
source = "../child/keyvalut"
keyvault = var.keyvault

}