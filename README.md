# terraform_b57

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | 1.5.7 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.102.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.102.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vm1"></a> [vm1](#module\_vm1) | ./modules/instance | n/a |
| <a name="module_vm2"></a> [vm2](#module\_vm2) | ./modules/instance | n/a |

## Resources

| Name | Type |
|------|------|
| [yandex_lb_network_load_balancer.web_load_balancer](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/lb_network_load_balancer) | resource |
| [yandex_lb_target_group.web_servers_group](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/lb_target_group) | resource |
| [yandex_vpc_network.network](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/vpc_network) | resource |
| [yandex_vpc_subnet.subnet_10](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/vpc_subnet) | resource |
| [yandex_vpc_subnet.subnet_20](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/vpc_subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cloud_id"></a> [cloud\_id](#input\_cloud\_id) | The ID of the cloud to apply any resources to | `string` | `""` | no |
| <a name="input_folder_id"></a> [folder\_id](#input\_folder\_id) | The ID of the folder to operate under, if not specified by a given resource | `string` | `""` | no |
| <a name="input_token"></a> [token](#input\_token) | Security token or IAM token used for authentication in Yandex.Cloud | `string` | `""` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Use specific availability zone | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip_1"></a> [external\_ip\_1](#output\_external\_ip\_1) | External VM 1 IP |
| <a name="output_external_ip_2"></a> [external\_ip\_2](#output\_external\_ip\_2) | External VM 2 IP |
| <a name="output_internal_ip_1"></a> [internal\_ip\_1](#output\_internal\_ip\_1) | Internal VM 1 IP |
| <a name="output_internal_ip_2"></a> [internal\_ip\_2](#output\_internal\_ip\_2) | Internal VM 2 IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
