# instance

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=  0.13 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | 0.102.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | 0.101.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_compute_image.vm-image](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/compute_image) | resource |
| [yandex_compute_instance.vm](https://registry.terraform.io/providers/yandex-cloud/yandex/0.102.0/docs/resources/compute_instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The subnet ID | `string` | n/a | yes |
| <a name="input_vm_image_family"></a> [vm\_image\_family](#input\_vm\_image\_family) | The image family | `string` | `"lemp"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | VM name | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The availability zone to operate under | `string` | `"ru-central1-a"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_ip"></a> [external\_ip](#output\_external\_ip) | External IP |
| <a name="output_internal_ip"></a> [internal\_ip](#output\_internal\_ip) | Internal IP |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
