# Azure Resource Group Module

This module is used to create and manage Azure Resource Groups.

## Usage

```hcl
module "network_resource_group" {
  source = "../../../tf-modules/resource_group"

  resource_group_name = "rg-ntw-layer-${local.environment}-${local.env_instance}"
  location            = local.location
  tags                = local.tags
}
```

## Inputs

| Name                | Description                          | Type     | Default | Required |
|---------------------|--------------------------------------|----------|---------|----------|
| `resource_group_name` | The name of the resource group.      | `string` | n/a     | yes      |
| `location`          | The Azure region for the resource group. | `string` | n/a     | yes      |
| `tags`              | A mapping of tags to assign to the resource group. | `map(string)` | `{}`    | no       |

## Outputs

| Name                | Description                          |
|---------------------|--------------------------------------|
| `resource_group_id` | The ID of the created resource group. |
| `resource_group_name` | The name of the created resource group. |

## Example

Refer to the [Usage](#usage) section for an example of how to use this module.

## License

This project is licensed under the MIT License. See the [LICENSE](../../LICENSE) file for details.