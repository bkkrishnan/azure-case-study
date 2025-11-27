# Subnet Module

This Terraform module is designed to create and manage Azure Subnets. It provides a simple way to define and configure subnets within a virtual network.

## Usage

```hcl
module "network_subnet" {
  source                = "../../../tf-modules/subnet"
  
  subnet_name           = "subnet-ntw-layer-${local.environment}-${local.env_instance}"
  resource_group_name   = module.network_resource_group.resource_group_name.name
  vnet_name             = module.network_vnet.vnet_name.name
  subnet_address_prefix = ["172.19.10.0/23"]
}
```

## Inputs

| Name                  | Description                                  | Type     | Default | Required |
|-----------------------|----------------------------------------------|----------|---------|----------|
| `name`               | The name of the subnet.                     | `string` | n/a     | yes      |
| `resource_group_name`| The name of the resource group.             | `string` | n/a     | yes      |
| `virtual_network_name`| The name of the virtual network.            | `string` | n/a     | yes      |
| `address_prefixes`   | The address prefixes for the subnet.        | `list`   | n/a     | yes      |

## Outputs

| Name                  | Description                                  |
|-----------------------|----------------------------------------------|
| `id`                 | The ID of the subnet.                       |
| `name`               | The name of the subnet.                     |
| `address_prefixes`   | The address prefixes of the subnet.         |

## Requirements

| Name      | Version |
|-----------|---------|
| Terraform | >= 1.0  |
| AzureRM   | >= 3.0  |

## Providers

| Name    | Version |
|---------|---------|
| AzureRM | >= 3.0  |

## License

This module is licensed under the MIT License. See the [LICENSE](../LICENSE) file for details.