
rg = {
  resorce_group_Eric = {
    name     = "resorce_group_Eric"
    location = "centralindia"
  }
}
vnet = {
  vnet1 = {
    name                = "vnet1"
    address_space       = ["10.0.0.0/16"]
    location            = "centralindia"
    resource_group_name = "resorce_group_Eric"
  }
    vnet2 = {
    name                = "vnet2"
    address_space       = ["10.1.0.0/16"]
    location            = "centralindia"
    resource_group_name = "resorce_group_Eric"
  }
        vnet3 = {
    name                = "vnet3"
    address_space       = ["10.20.0.0/16"]
    location            = "centralindia"
    resource_group_name = "resorce_group_Eric"
  }
}

subnet = {
  subnet1 = {
    name                 = "subnet-front"
    resource_group_name  = "resorce_group_Eric"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.3.0/24"]

  }
  subnet2 = {
    name                 = "subnet-back"
    resource_group_name  = "resorce_group_Eric"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.4.0/24"]
  }
  subnet3 = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "resorce_group_Eric"
    virtual_network_name = "vnet1"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

pip = {
  pip1 = {

    name                = "pip1"
    resource_group_name = "resorce_group_Eric"
    location            = "centralindia"

  }

}

nic = {
  nic1 = {
    name                 = "nic1"
    location             = "centralindia"
    resource_group_name  = "resorce_group_Eric"
    nameipconfig         = "pipipconfig1"
    # pipdataname          = "pipdataname1"
    virtual_network_name = "vnet1"
    subnetdataname       = "subnet-front"
  }
  nic2 = {
    name                 = "nic2"
    location             = "centralindia"
    resource_group_name  = "resorce_group_Eric"
    nameipconfig         = "pipipconfig2"
    # pipdataname          = "pipdataname2"
    virtual_network_name = "vnet1"
    subnetdataname       = "subnet-back"
  }
}

nsg = {
  nsg1 = {
    name                = "nsg1"
    location            = "centralindia"
    resource_group_name = "resorce_group_Eric"
  }
  nsg2 = {
    name                = "nsg2"
    location            = "centralindia"
    resource_group_name = "resorce_group_Eric"
  }
}

association = {

  association1 = {

    nicx = "nic1"

    nsgx = "nsg1"

  }

  association2 = {

    nicx = "nic2"

    nsgx = "nsg2"

  }

}

vms = {
  vm1 = {
    name                = "vm-front"
    resource_group_name = "resorce_group_Eric"
    location            = "centralindia"
    vm_size             = "Standard_D2s_v3"
    namedisk            = "front-vm-disk"
    admin_username      = "adminuser"
    admin_password      = "Password@123"
    nicx                = "nic1"
  }
  vm2 = {
    name                = "vm-back"
    resource_group_name = "resorce_group_Eric"
    location            = "centralindia"
    vm_size             = "Standard_D2s_v3"
    namedisk            = "back-vm-disk"
    admin_username      = "adminuser"
    admin_password      = "Password@123"
    nicx                = "nic2"
  }
}

bastion = {
  bastion1 = {

    name                = "bastion_vnet1"
    resource_group_name = "resorce_group_Eric"
    location            = "centralindia"
    bastionipconfig     = "bastionipconfig"
    bastion_subnet_x    = "subnet3"
    pip_x               = "pip1"
  }
}

keyvault={
  keyvault1={
      name                        = "keyvault1"
  location                    = "centralindia"
  resource_group_name         = "resorce_group_Eric"
  rbac_authorization_enabled  = false
  enabled_for_disk_encryption = false
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  }
}