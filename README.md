# terraform-module-use-twice-two-regions
This repository shows a simple example of a module that is used twice. \
The root module (where terraform apply is used) invokes mod-vpc module twice to create a resource in 2 regions with AWS provider.


# How to use this repo
It is assumed that credentials/API keys to manage AWS are configured for your environment. For more details check this [LINK](https://blog.gruntwork.io/a-comprehensive-guide-to-managing-secrets-in-your-terraform-code-1d586955ace1).

Clone the repository and cd into the newly downloaded repo:
```
git clone https://github.com/ion-training/terraform-module-use-twice-two-regions.git
```
```
cd terraform-module-use-twice-two-regions
```

Terraform init and terraform apply (-auto-approve used for brevity)
```
terraform init
```
```
terraform apply -auto-approve
```

To destroy the resources
```
terraform destroy
```


# Sample output
```
$ terraform init
Initializing modules...
- vpc_web_west1 in mod-vpc
- vpc_web_west2 in mod-vpc

Initializing the backend...

Initializing provider plugins...
- Finding hashicorp/aws versions matching ">= 3.62.0, 3.62.0"...
- Installing hashicorp/aws v3.62.0...
- Installed hashicorp/aws v3.62.0 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

```
$ terraform apply -auto-approve

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # module.vpc_web_west1.aws_vpc.web_vpc will be created
  + resource "aws_vpc" "web_vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags_all                         = (known after apply)
    }

  # module.vpc_web_west2.aws_vpc.web_vpc will be created
  + resource "aws_vpc" "web_vpc" {
      + arn                              = (known after apply)
      + assign_generated_ipv6_cidr_block = false
      + cidr_block                       = "10.202.0.0/16"
      + default_network_acl_id           = (known after apply)
      + default_route_table_id           = (known after apply)
      + default_security_group_id        = (known after apply)
      + dhcp_options_id                  = (known after apply)
      + enable_classiclink               = (known after apply)
      + enable_classiclink_dns_support   = (known after apply)
      + enable_dns_hostnames             = (known after apply)
      + enable_dns_support               = true
      + id                               = (known after apply)
      + instance_tenancy                 = "default"
      + ipv6_association_id              = (known after apply)
      + ipv6_cidr_block                  = (known after apply)
      + main_route_table_id              = (known after apply)
      + owner_id                         = (known after apply)
      + tags_all                         = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
module.vpc_web_west2.aws_vpc.web_vpc: Creating...
module.vpc_web_west1.aws_vpc.web_vpc: Creating...
module.vpc_web_west2.aws_vpc.web_vpc: Creation complete after 2s [id=vpc-07249cdef6bc914a7]
module.vpc_web_west1.aws_vpc.web_vpc: Creation complete after 2s [id=vpc-023ce69b1f3505d8f]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.
```

```
terraform destroy
module.vpc_web_west1.aws_vpc.web_vpc: Refreshing state... [id=vpc-023ce69b1f3505d8f]
module.vpc_web_west2.aws_vpc.web_vpc: Refreshing state... [id=vpc-07249cdef6bc914a7]

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the last "terraform apply":

  # module.vpc_web_west1.aws_vpc.web_vpc has been changed
  ~ resource "aws_vpc" "web_vpc" {
        id                               = "vpc-023ce69b1f3505d8f"
      + tags                             = {}
        # (15 unchanged attributes hidden)
    }
  # module.vpc_web_west2.aws_vpc.web_vpc has been changed
  ~ resource "aws_vpc" "web_vpc" {
        id                               = "vpc-07249cdef6bc914a7"
      + tags                             = {}
        # (13 unchanged attributes hidden)
    }

Unless you have made equivalent changes to your configuration, or ignored the relevant attributes using ignore_changes, the following plan may include actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # module.vpc_web_west1.aws_vpc.web_vpc will be destroyed
  - resource "aws_vpc" "web_vpc" {
      - arn                              = "arn:aws:ec2:eu-west-1:267023797923:vpc/vpc-023ce69b1f3505d8f" -> null
      - assign_generated_ipv6_cidr_block = false -> null
      - cidr_block                       = "10.202.0.0/16" -> null
      - default_network_acl_id           = "acl-0624b5a1864301edc" -> null
      - default_route_table_id           = "rtb-0bcabd6ba0b2905d8" -> null
      - default_security_group_id        = "sg-0fb2e308f72b94465" -> null
      - dhcp_options_id                  = "dopt-44645122" -> null
      - enable_classiclink               = false -> null
      - enable_classiclink_dns_support   = false -> null
      - enable_dns_hostnames             = false -> null
      - enable_dns_support               = true -> null
      - id                               = "vpc-023ce69b1f3505d8f" -> null
      - instance_tenancy                 = "default" -> null
      - main_route_table_id              = "rtb-0bcabd6ba0b2905d8" -> null
      - owner_id                         = "267023797923" -> null
      - tags                             = {} -> null
      - tags_all                         = {} -> null
    }

  # module.vpc_web_west2.aws_vpc.web_vpc will be destroyed
  - resource "aws_vpc" "web_vpc" {
      - arn                              = "arn:aws:ec2:eu-west-2:267023797923:vpc/vpc-07249cdef6bc914a7" -> null
      - assign_generated_ipv6_cidr_block = false -> null
      - cidr_block                       = "10.202.0.0/16" -> null
      - default_network_acl_id           = "acl-0a12db12fd1fa2bef" -> null
      - default_route_table_id           = "rtb-0312d06e87cbf7010" -> null
      - default_security_group_id        = "sg-08e26088e9d8b3aa5" -> null
      - dhcp_options_id                  = "dopt-157f5f7d" -> null
      - enable_dns_hostnames             = false -> null
      - enable_dns_support               = true -> null
      - id                               = "vpc-07249cdef6bc914a7" -> null
      - instance_tenancy                 = "default" -> null
      - main_route_table_id              = "rtb-0312d06e87cbf7010" -> null
      - owner_id                         = "267023797923" -> null
      - tags                             = {} -> null
      - tags_all                         = {} -> null
    }

Plan: 0 to add, 0 to change, 2 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

module.vpc_web_west1.aws_vpc.web_vpc: Destroying... [id=vpc-023ce69b1f3505d8f]
module.vpc_web_west2.aws_vpc.web_vpc: Destroying... [id=vpc-07249cdef6bc914a7]
module.vpc_web_west1.aws_vpc.web_vpc: Destruction complete after 0s
module.vpc_web_west2.aws_vpc.web_vpc: Destruction complete after 1s

Destroy complete! Resources: 2 destroyed.
```


