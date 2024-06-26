## Description

This module is inspired by pre-existing-vpc, but is changed with the objective of supporting Shared VPCs.

The module outputs are aligned with the [vpc module][vpc] so that it can be used
as a drop-in substitute when a VPC already exists.

For example, the blueprint below discovers the "default" global network and the
"default" regional subnetwork in us-central1. With the `use` keyword, the
[vm-instance] module accepts the `network_self_link` and `subnetwork_self_link`
input variables that uniquely identify the network and subnetwork in which the
VM will be created.

[vpc]: ../vpc/README.md
[vm-instance]: ../../compute/vm-instance/README.md

> **_NOTE:_** Additional IAM work is needed for this to work correctly.

### Example

```yaml
- id: network1
  source: community/modules/network/pre-existing-shared-vpc
  settings:
    network_name: name-of-network
    host_project_id: name-of-host-project
    subnetwork_self_link: https://www.googleapis.com/compute/v1/projects/name-of-host-project/regions/REGION/subnetworks/SUBNETNAME	

- id: example_vm
  source: modules/compute/vm-instance
  use:
  - network1
  settings:
    name_prefix: example
    machine_type: c2-standard-4
```

## License

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Copyright 2022 Google LLC

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 3.83 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | >= 3.83 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_compute_network.vpc](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_network) | data source |
| [google_compute_subnetwork.primary_subnetwork](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_subnetwork) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_host_project_id"></a> [host\_project\_id](#input\_host\_project\_id) | Project id of the host project | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Name of the existing Shared VPC network | `string` | n/a | yes |
| <a name="input_subnetwork_self_link"></a> [subnetwork\_self\_link](#input\_subnetwork\_self\_link) | Self-link of the subnet in the Shared VPC | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID of the existing VPC network |
| <a name="output_network_name"></a> [network\_name](#output\_network\_name) | Name of the existing VPC network |
| <a name="output_network_self_link"></a> [network\_self\_link](#output\_network\_self\_link) | Self link of the existing VPC network |
| <a name="output_subnetwork"></a> [subnetwork](#output\_subnetwork) | Full subnetwork object in the primary region |
| <a name="output_subnetwork_address"></a> [subnetwork\_address](#output\_subnetwork\_address) | Subnetwork IP range in the primary region |
| <a name="output_subnetwork_name"></a> [subnetwork\_name](#output\_subnetwork\_name) | Name of the subnetwork in the primary region |
| <a name="output_subnetwork_self_link"></a> [subnetwork\_self\_link](#output\_subnetwork\_self\_link) | Subnetwork self-link in the primary region |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
