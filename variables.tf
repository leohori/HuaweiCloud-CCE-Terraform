terraform {
  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.40.1"
    }
  }
}

provider "huaweicloud" {
    region     = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

variable "region" {
    type    = string
    default = "la-south-2"
}

variable "availability_zone_names" {
  type        = list(string)
  default     = ["la-south-2a","la-south-2b"]
}

variable "access_key" {
    type    = string
    default = ""
}

variable "secret_key" {
    type    = string
    default = ""
}

variable "vpc_name" {
    type    = string
    default = "vpc_cce"
}

variable "vpc_cidr" {
    type    = string
    default = "172.16.0.0/16"
}

variable "subnet_name" {
    type    = string
    default = "subnet_cce"
}

variable "subnet_cidr" {
    type    = string
    default = "172.16.0.0/24"
}

variable "subnet_gw" {
    type    = string
    default = "172.16.0.1"

}

variable "cce_cluster_name" {
    type    = string
    default = "cce-demo"
}
	
variable "cce_cluster_charging_mode" {
    type    = string
    default = "postPaid"
}
	
variable "cce_cluster_type" {
    type    = string
    default = "VirtualMachine"
}
	
variable "cce_cluster_version" {
    type    = string
    default = "v1.23"
}
	
variable "cce_cluster_flavor_id" {
    type    = string
    default = "cce.s2.small"
}
	
variable "cce_cluster_network_type" {
    type    = string
    default = "overlay_l2"
}
	
variable "cce_cluster_authentication_mode" {
    type    = string
    default = "rbac"
}
	
variable "cce_cluster_container_network_cidr" {
    type    = string
    default = "10.0.0.0/16"
}

variable "cce_node_name_1" {
    type    = string
    default = "cce-demo-node-1"
}

variable "cce_node_name_2" {
    type    = string
    default = "cce-demo-node-2"
}

variable "cce_node_flavor_id" {
    type    = string
    default = "s6.large.2"
}
	
variable "cce_node_key_pair" {
    type    = string
    default = "KeyPair-cce"
}

variable "cce_node_billing_mode" {
    type    = string
    default = "0"
}
