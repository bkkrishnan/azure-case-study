# Network Security Group (NSG) Module

This Terraform module creates and manages Azure Network Security Groups (NSGs) and their associated security rules.

## Features

- Create an NSG with customizable security rules.
- Define inbound and outbound rules for traffic control.
- Associate NSGs with subnets or network interfaces.

## Usage

```hcl
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
```

## Inputs

| Name                  | Type   | Description                                      | Default |
|-----------------------|--------|--------------------------------------------------|---------|
| `nsg_name`            | string | Name of the Network Security Group.             | n/a     |
| `resource_group_name` | string | Name of the resource group.                     | n/a     |
| `location`            | string | Azure region where the NSG will be created.     | n/a     |
| `security_rules`      | list   | List of security rules to apply to the NSG.     | `[]`    |

## Outputs

| Name         | Description                          |
|--------------|--------------------------------------|
| `nsg_id`     | The ID of the created NSG.          |
| `nsg_name`   | The name of the created NSG.        |

## Requirements

- Terraform >= 1.0
- Azure Provider >= 3.0

## License

This module is licensed under the MIT License. See [LICENSE](../LICENSE) for details.