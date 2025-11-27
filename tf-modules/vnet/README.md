# Virtual Network (VNet) Module

This Terraform module creates and manages an Azure Virtual Network (VNet) and its associated resources.

## Features

- Create a Virtual Network (VNet)
- Configure address spaces
- Define subnets
- Enable DDoS protection (optional)
- Associate NSGs with subnets (optional)

## Usage

```hcl
module "network_vnet" {
  source              = "../../../tf-modules/vnet"
  vnet_name           = "vnet-ntw-layer-${local.environment}-${local.env_instance}"
  location            = local.location
  resource_group_name = module.network_resource_group.resource_group_name.name
  vent_address_space  = ["172.19.10.0/20"]
  tags                = local.tags
}
```

## Inputs

| Name                  | Type          | Description                                      | Default       | Required |
|-----------------------|---------------|--------------------------------------------------|---------------|----------|
| `name`               | `string`      | Name of the Virtual Network                     | n/a           | yes      |
| `resource_group_name`| `string`      | Name of the resource group                      | n/a           | yes      |
| `location`           | `string`      | Azure region where the VNet will be created     | n/a           | yes      |
| `address_space`      | `list(string)`| List of address spaces for the VNet             | n/a           | yes      |
| `subnets`            | `list(object)`| List of subnets with name and address prefix    | `[]`          | no       |
| `tags`               | `map(string)` | Tags to apply to the resources                  | `{}`          | no       |

## Outputs

| Name           | Description                          |
|----------------|--------------------------------------|
| `vnet_id`      | ID of the created Virtual Network    |
| `subnet_ids`   | IDs of the created subnets           |

## Requirements

- Terraform >= 1.0
- Azure Provider >= 3.0

## Notes

- Ensure the address spaces and subnets do not overlap with existing networks.
- Subnets can be associated with NSGs outside this module.

## License

This module is licensed under the MIT License. See [LICENSE](../LICENSE) for details.