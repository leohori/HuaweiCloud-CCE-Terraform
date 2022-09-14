# Huawei Cloud - CCE Service - Terraform

## Description

This is a demo on how you can use an infrastructure as code tool (like Terraform) to build, change, and manage your infrastructure in Huawei Cloud in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share. In this case, we will create a CCE cluster on Huawei Cloud using Terraform. 

In this demo, we will create a VPC with a Subnet and a Kubernetes cluster (CCE service) with 3 master nodes and 2 worker nodes. 

## Requirements

Terraform CLI

## Preparation

Set the following variables in the variables.tf file.
```
access_key : Access Key of your Huawei Cloud account
secret_key : Secret Key of your Huawei Cloud account
```

## Execution

Note: Successfully tested on Ubuntu 18.04 with Terraform 1.2.9

```
$ terraform init

Initializing the backend...

Initializing provider plugins...
- Reusing previous version of huaweicloud/huaweicloud from the dependency lock file
- Using previously-installed huaweicloud/huaweicloud v1.40.1

Terraform has been successfully initialized!
```

```
$ terraform plan

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # huaweicloud_cce_cluster_v3.cluster will be created
  + resource "huaweicloud_cce_cluster_v3" "cluster" {
      + authentication_mode    = "rbac"
      + billing_mode           = (known after apply)
      + certificate_clusters   = (known after apply)
      + certificate_users      = (known after apply)
      + charging_mode          = "postPaid"
      + cluster_type           = "VirtualMachine"
      + cluster_version        = "v1.23"
      + container_network_cidr = "10.0.0.0/16"
      + container_network_type = "overlay_l2"
      + description            = (known after apply)
      + eni_subnet_cidr        = (known after apply)
      + eni_subnet_id          = (known after apply)
      + enterprise_project_id  = (known after apply)
      + flavor_id              = "cce.s2.small"
      + highway_subnet_id      = (known after apply)
      + id                     = (known after apply)
      + kube_config_raw        = (known after apply)
      + name                   = "cce-demo"
      + region                 = (known after apply)
      + security_group_id      = (known after apply)
      + service_network_cidr   = (known after apply)
      + status                 = (known after apply)
      + subnet_id              = (known after apply)
      + vpc_id                 = (known after apply)

      + masters {
          + availability_zone = (known after apply)
        }
    }

  # huaweicloud_cce_node_v3.node_1 will be created
  + resource "huaweicloud_cce_node_v3" "node_1" {
      + availability_zone = "la-south-2a"
      + billing_mode      = (known after apply)
      + charging_mode     = (known after apply)
      + cluster_id        = (known after apply)
      + flavor_id         = "s6.large.2"
      + id                = (known after apply)
      + key_pair          = "KeyPair-cce"
      + name              = "cce-demo-node-1"
      + os                = (known after apply)
      + private_ip        = (known after apply)
      + public_ip         = (known after apply)
      + region            = (known after apply)
      + runtime           = (known after apply)
      + server_id         = (known after apply)
      + status            = (known after apply)
      + subnet_id         = (known after apply)

      + data_volumes {
          + extend_params = (known after apply)
          + kms_key_id    = (known after apply)
          + size          = 100
          + volumetype    = "SSD"
        }

      + root_volume {
          + extend_params = (known after apply)
          + size          = 40
          + volumetype    = "SSD"
        }
    }

  # huaweicloud_cce_node_v3.node_2 will be created
  + resource "huaweicloud_cce_node_v3" "node_2" {
      + availability_zone = "la-south-2b"
      + billing_mode      = (known after apply)
      + charging_mode     = (known after apply)
      + cluster_id        = (known after apply)
      + flavor_id         = "s6.large.2"
      + id                = (known after apply)
      + key_pair          = "KeyPair-cce"
      + name              = "cce-demo-node-2"
      + os                = (known after apply)
      + private_ip        = (known after apply)
      + public_ip         = (known after apply)
      + region            = (known after apply)
      + runtime           = (known after apply)
      + server_id         = (known after apply)
      + status            = (known after apply)
      + subnet_id         = (known after apply)

      + data_volumes {
          + extend_params = (known after apply)
          + kms_key_id    = (known after apply)
          + size          = 100
          + volumetype    = "SSD"
        }

      + root_volume {
          + extend_params = (known after apply)
          + size          = 40
          + volumetype    = "SSD"
        }
    }

  # huaweicloud_vpc.vpc will be created
  + resource "huaweicloud_vpc" "vpc" {
      + cidr                  = "172.16.0.0/16"
      + enterprise_project_id = (known after apply)
      + id                    = (known after apply)
      + name                  = "vpc_cce"
      + region                = (known after apply)
      + routes                = (known after apply)
      + status                = (known after apply)
    }

  # huaweicloud_vpc_subnet.subnet will be created
  + resource "huaweicloud_vpc_subnet" "subnet" {
      + availability_zone = (known after apply)
      + cidr              = "172.16.0.0/24"
      + dhcp_enable       = true
      + dns_list          = (known after apply)
      + gateway_ip        = "172.16.0.1"
      + id                = (known after apply)
      + ipv6_cidr         = (known after apply)
      + ipv6_gateway      = (known after apply)
      + ipv6_subnet_id    = (known after apply)
      + name              = "subnet_cce"
      + primary_dns       = (known after apply)
      + region            = (known after apply)
      + secondary_dns     = (known after apply)
      + subnet_id         = (known after apply)
      + vpc_id            = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.
```

```
$ terraform apply

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # huaweicloud_cce_cluster_v3.cluster will be created
  + resource "huaweicloud_cce_cluster_v3" "cluster" {
      + authentication_mode    = "rbac"
      + billing_mode           = (known after apply)
      + certificate_clusters   = (known after apply)
      + certificate_users      = (known after apply)
      + charging_mode          = "postPaid"
      + cluster_type           = "VirtualMachine"
      + cluster_version        = "v1.23"
      + container_network_cidr = "10.0.0.0/16"
      + container_network_type = "overlay_l2"
      + description            = (known after apply)
      + eni_subnet_cidr        = (known after apply)
      + eni_subnet_id          = (known after apply)
      + enterprise_project_id  = (known after apply)
      + flavor_id              = "cce.s2.small"
      + highway_subnet_id      = (known after apply)
      + id                     = (known after apply)
      + kube_config_raw        = (known after apply)
      + name                   = "cce-demo"
      + region                 = (known after apply)
      + security_group_id      = (known after apply)
      + service_network_cidr   = (known after apply)
      + status                 = (known after apply)
      + subnet_id              = (known after apply)
      + vpc_id                 = (known after apply)

      + masters {
          + availability_zone = (known after apply)
        }
    }

  # huaweicloud_cce_node_v3.node_1 will be created
  + resource "huaweicloud_cce_node_v3" "node_1" {
      + availability_zone = "la-south-2a"
      + billing_mode      = (known after apply)
      + charging_mode     = (known after apply)
      + cluster_id        = (known after apply)
      + flavor_id         = "s6.large.2"
      + id                = (known after apply)
      + key_pair          = "KeyPair-cce"
      + name              = "cce-demo-node-1"
      + os                = (known after apply)
      + private_ip        = (known after apply)
      + public_ip         = (known after apply)
      + region            = (known after apply)
      + runtime           = (known after apply)
      + server_id         = (known after apply)
      + status            = (known after apply)
      + subnet_id         = (known after apply)

      + data_volumes {
          + extend_params = (known after apply)
          + kms_key_id    = (known after apply)
          + size          = 100
          + volumetype    = "SSD"
        }

      + root_volume {
          + extend_params = (known after apply)
          + size          = 40
          + volumetype    = "SSD"
        }
    }

  # huaweicloud_cce_node_v3.node_2 will be created
  + resource "huaweicloud_cce_node_v3" "node_2" {
      + availability_zone = "la-south-2b"
      + billing_mode      = (known after apply)
      + charging_mode     = (known after apply)
      + cluster_id        = (known after apply)
      + flavor_id         = "s6.large.2"
      + id                = (known after apply)
      + key_pair          = "KeyPair-cce"
      + name              = "cce-demo-node-2"
      + os                = (known after apply)
      + private_ip        = (known after apply)
      + public_ip         = (known after apply)
      + region            = (known after apply)
      + runtime           = (known after apply)
      + server_id         = (known after apply)
      + status            = (known after apply)
      + subnet_id         = (known after apply)

      + data_volumes {
          + extend_params = (known after apply)
          + kms_key_id    = (known after apply)
          + size          = 100
          + volumetype    = "SSD"
        }

      + root_volume {
          + extend_params = (known after apply)
          + size          = 40
          + volumetype    = "SSD"
        }
    }

  # huaweicloud_vpc.vpc will be created
  + resource "huaweicloud_vpc" "vpc" {
      + cidr                  = "172.16.0.0/16"
      + enterprise_project_id = (known after apply)
      + id                    = (known after apply)
      + name                  = "vpc_cce"
      + region                = (known after apply)
      + routes                = (known after apply)
      + status                = (known after apply)
    }

  # huaweicloud_vpc_subnet.subnet will be created
  + resource "huaweicloud_vpc_subnet" "subnet" {
      + availability_zone = (known after apply)
      + cidr              = "172.16.0.0/24"
      + dhcp_enable       = true
      + dns_list          = (known after apply)
      + gateway_ip        = "172.16.0.1"
      + id                = (known after apply)
      + ipv6_cidr         = (known after apply)
      + ipv6_gateway      = (known after apply)
      + ipv6_subnet_id    = (known after apply)
      + name              = "subnet_cce"
      + primary_dns       = (known after apply)
      + region            = (known after apply)
      + secondary_dns     = (known after apply)
      + subnet_id         = (known after apply)
      + vpc_id            = (known after apply)
    }

Plan: 5 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

huaweicloud_vpc.vpc: Creating...
huaweicloud_vpc.vpc: Creation complete after 7s [id=6b93ea2a-1650-4f7d-82dd-2b75f5132ef5]
huaweicloud_vpc_subnet.subnet: Creating...
huaweicloud_vpc_subnet.subnet: Creation complete after 6s [id=2d8837e3-bc0a-452a-9d6a-095e9977d14d]
huaweicloud_cce_cluster_v3.cluster: Creating...
huaweicloud_cce_cluster_v3.cluster: Still creating... [10s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [20s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [30s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [40s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [50s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m0s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m10s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m20s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m30s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m40s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [1m50s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m0s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m11s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m21s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m31s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m41s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [2m51s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m1s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m11s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m21s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m31s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m41s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [3m51s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m1s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m11s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m21s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m31s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m41s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [4m51s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m1s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m11s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m21s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m31s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m41s elapsed]
huaweicloud_cce_cluster_v3.cluster: Still creating... [5m51s elapsed]
huaweicloud_cce_cluster_v3.cluster: Creation complete after 5m59s [id=01ccd331-3452-11ed-b204-0255ac100232]
huaweicloud_cce_node_v3.node_2: Creating...
huaweicloud_cce_node_v3.node_1: Creating...
huaweicloud_cce_node_v3.node_1: Still creating... [10s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [10s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [20s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [20s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [30s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [30s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [40s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [40s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [50s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [50s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m0s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m0s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m10s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m10s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m20s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m20s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m30s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m30s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m40s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m40s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [1m50s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [1m50s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m0s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m0s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m10s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m10s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m20s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m20s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m30s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m30s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m40s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m40s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [2m50s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [2m50s elapsed]
huaweicloud_cce_node_v3.node_1: Still creating... [3m0s elapsed]
huaweicloud_cce_node_v3.node_2: Still creating... [3m0s elapsed]
huaweicloud_cce_node_v3.node_1: Creation complete after 3m8s [id=da29389f-3452-11ed-a889-0255ac10024d]
huaweicloud_cce_node_v3.node_2: Creation complete after 3m8s [id=d9c8112f-3452-11ed-a889-0255ac10024d]

Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
```

## Useful Links

https://support.huaweicloud.com/intl/en-us/productdesc-terraform/index.html

https://registry.terraform.io/providers/huaweicloud/huaweicloud/latest/docs

https://www.terraform.io/downloads
