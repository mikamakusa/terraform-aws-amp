## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.55.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.61.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_cloudwatch"></a> [cloudwatch](#module\_cloudwatch) | git@github.com:mikamakusa/terraform-aws-cloudwatch | 1.0.3 |
| <a name="module_eks"></a> [eks](#module\_eks) | git@github.com:mikamakusa/terraform-aws-eks.git | 1.0.1 |
| <a name="module_kms"></a> [kms](#module\_kms) | git@github.com:mikamakusa/terraform-aws-kms.git | 1.0.1 |

## Resources

| Name | Type |
|------|------|
| [aws_prometheus_alert_manager_definition.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_alert_manager_definition) | resource |
| [aws_prometheus_rule_group_namespace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_rule_group_namespace) | resource |
| [aws_prometheus_scraper.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_scraper) | resource |
| [aws_prometheus_workspace.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/prometheus_workspace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alert_manager_definition"></a> [alert\_manager\_definition](#input\_alert\_manager\_definition) | n/a | <pre>list(object({<br>    id           = number<br>    definition   = string<br>    workspace_id = optional(number)<br>  }))</pre> | `[]` | no |
| <a name="input_cluster"></a> [cluster](#input\_cluster) | EKS Cluster variable to define a K8s cluster on AWS | `any` | `[]` | no |
| <a name="input_key"></a> [key](#input\_key) | KMS Key from AWS KMS managed service | `any` | `[]` | no |
| <a name="input_log_group"></a> [log\_group](#input\_log\_group) | Log Group on AWS Cloudwatch | `any` | `[]` | no |
| <a name="input_rule_group_namespace"></a> [rule\_group\_namespace](#input\_rule\_group\_namespace) | n/a | <pre>list(object({<br>    id           = number<br>    name         = string<br>    workspace_id = optional(number)<br>    data         = string<br>  }))</pre> | `[]` | no |
| <a name="input_scraper"></a> [scraper](#input\_scraper) | n/a | <pre>list(object({<br>    id                   = number<br>    scrape_configuration = string<br>    alias                = optional(string)<br>    destination = list(object({<br>      amp = list(object({<br>        workspace_id = number<br>      }))<br>    }))<br>    source = optional(list(object({<br>      eks = optional(list(object({<br>        cluster_id = optional(number)<br>      })))<br>    })))<br>  }))</pre> | `[]` | no |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | n/a | <pre>list(object({<br>    id         = number<br>    alias      = optional(string)<br>    kms_key_id = optional(number)<br>    tags       = optional(map(string))<br>    logging_configuration = optional(list(object({<br>      log_group_id = optional(number)<br>    })))<br>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_alert_manager_definition_definition"></a> [alert\_manager\_definition\_definition](#output\_alert\_manager\_definition\_definition) | n/a |
| <a name="output_alert_manager_definition_id"></a> [alert\_manager\_definition\_id](#output\_alert\_manager\_definition\_id) | n/a |
| <a name="output_alert_manager_definition_workspace_id"></a> [alert\_manager\_definition\_workspace\_id](#output\_alert\_manager\_definition\_workspace\_id) | n/a |
| <a name="output_rule_group_namespace_data"></a> [rule\_group\_namespace\_data](#output\_rule\_group\_namespace\_data) | n/a |
| <a name="output_rule_group_namespace_id"></a> [rule\_group\_namespace\_id](#output\_rule\_group\_namespace\_id) | n/a |
| <a name="output_rule_group_namespace_name"></a> [rule\_group\_namespace\_name](#output\_rule\_group\_namespace\_name) | n/a |
| <a name="output_rule_group_namespace_workspace_id"></a> [rule\_group\_namespace\_workspace\_id](#output\_rule\_group\_namespace\_workspace\_id) | n/a |
| <a name="output_scraper_alias"></a> [scraper\_alias](#output\_scraper\_alias) | n/a |
| <a name="output_scraper_id"></a> [scraper\_id](#output\_scraper\_id) | n/a |
| <a name="output_scraper_scrape_configuration"></a> [scraper\_scrape\_configuration](#output\_scraper\_scrape\_configuration) | n/a |
| <a name="output_workspace_alias"></a> [workspace\_alias](#output\_workspace\_alias) | n/a |
| <a name="output_workspace_arn"></a> [workspace\_arn](#output\_workspace\_arn) | n/a |
| <a name="output_workspace_id"></a> [workspace\_id](#output\_workspace\_id) | n/a |
