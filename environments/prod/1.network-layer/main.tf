# Define the local variables for the environment
locals {
  environment  = "prod"
  location     = "uksouth"
  env_instance = "01"
  tags = {
    environment = "Prod"
    Owner       = "Bala"
    Purpose     = "Demo"
  }
}

# Creating the resource group for the network layer
module "network_resource_group" {
  source = "../../../tf-modules/resource_group"

  resource_group_name = "rg-ntw-layer-${local.environment}-${local.env_instance}"
  location            = local.location
  tags                = local.tags
}

# Creating the Vnet for the network layer
module "network_vnet" {
  source              = "../../../tf-modules/vnet"
  vnet_name           = "vnet-ntw-layer-${local.environment}-${local.env_instance}"
  location            = local.location
  resource_group_name = module.network_resource_group.resource_group_name.name
  vent_address_space  = ["172.19.10.0/20"]
  tags                = local.tags
}

# Creating the NSG for the network layer
module "network_nsg" {
  source              = "../../../tf-modules/nsg"
  nsg_name            = "nsg-ntw-layer-${local.environment}-${local.env_instance}"
  location            = local.location
  resource_group_name = module.network_resource_group.resource_group_name.name
  nsg_security_rules = [
    {
      name                       = "allow-all-inbound"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "deny-all-outbound"
      priority                   = 200
      direction                  = "Outbound"
      access                     = "Deny"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
  tags = local.tags

}

# Creating the SubNet for the network layer
module "network_subnet" {
  source                = "../../../tf-modules/subnet"
  
  subnet_name           = "subnet-ntw-layer-${local.environment}-${local.env_instance}"
  resource_group_name   = module.network_resource_group.resource_group_name.name
  vnet_name             = module.network_vnet.vnet_name.name
  subnet_address_prefix = ["172.19.10.0/23"]
}

# Creating the route tables for the network layer



# Creating the routes table association for the network layer
