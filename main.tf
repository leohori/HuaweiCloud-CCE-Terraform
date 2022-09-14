#------------------------------------------------------------------------------
#   VPC
#------------------------------------------------------------------------------
resource "huaweicloud_vpc" "vpc" {
  name = var.vpc_name
  cidr = var.vpc_cidr
}
#------------------------------------------------------------------------------
#  Subnet
#------------------------------------------------------------------------------
resource "huaweicloud_vpc_subnet" "subnet" {
  name       = var.subnet_name
  cidr       = var.subnet_cidr
  gateway_ip = var.subnet_gw
  vpc_id     = huaweicloud_vpc.vpc.id
}
#------------------------------------------------------------------------------
#   CCE Cluster (3 master nodes - HA cluster)
#------------------------------------------------------------------------------
resource "huaweicloud_cce_cluster_v3" "cluster" {
  name                   = var.cce_cluster_name
  charging_mode          = var.cce_cluster_charging_mode
  cluster_type           = var.cce_cluster_type
  cluster_version        = var.cce_cluster_version
  flavor_id              = var.cce_cluster_flavor_id
  vpc_id                 = huaweicloud_vpc.vpc.id
  subnet_id              = huaweicloud_vpc_subnet.subnet.id
  container_network_type = var.cce_cluster_network_type
  authentication_mode    = var.cce_cluster_authentication_mode
  container_network_cidr = var.cce_cluster_container_network_cidr
}

#------------------------------------------------------------------------------
#   CCE Cluster Nodes (2 worker nodes)
#------------------------------------------------------------------------------
resource "huaweicloud_cce_node_v3" "node_1" {
  cluster_id        = huaweicloud_cce_cluster_v3.cluster.id
  name              = var.cce_node_name_1
  flavor_id         = var.cce_node_flavor_id
  key_pair          = var.cce_node_key_pair
  availability_zone = var.availability_zone_names[0]

  root_volume {
    size            = 40
    volumetype      = "SSD"
  }
  
  data_volumes {
    size            = 100
    volumetype      = "SSD"
  }
}

resource "huaweicloud_cce_node_v3" "node_2" {
  cluster_id        = huaweicloud_cce_cluster_v3.cluster.id
  name              = var.cce_node_name_2
  flavor_id         = var.cce_node_flavor_id
  key_pair          = var.cce_node_key_pair
  availability_zone = var.availability_zone_names[1]

  root_volume {
    size            = 40
    volumetype      = "SSD"
  }

  data_volumes {
    size            = 100
    volumetype      = "SSD"
  }
}
