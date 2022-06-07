
module "management-vpc" {
  source          = "../modules/vpc"
  vpc             = var.management-vpc
  prefix-name-tag = var.prefix-name-tag
  subnets         = var.management-vpc-subnets
  route-tables    = var.management-vpc-route-tables
  security-groups = var.management-vpc-security-groups
  global_tags     = var.global_tags
}

resource "aws_network_interface" "private" {
  subnet_id       = module.management-vpc.subnet_ids["${module.management-vpc.vpc_name}-${var.panorama.subnet_name}"]
  private_ips     = var.panorama.private_ips
  security_groups = [module.management-vpc.security_groups["${var.prefix-name-tag}${var.panorama.security_group}"]]
  tags = merge({ Name = "${var.prefix-name-tag}${var.panorama.name}-primary-interface" }, var.global_tags)
}

resource "aws_instance" "this" {
  ami                         = var.panorama.ami
  instance_type               = var.panorama.instance_type
  key_name                    = module.management-vpc.ssh_key_name
  network_interface {
    network_interface_id = aws_network_interface.private.id
    device_index = 0
  }

  tags = merge({ Name = "${var.prefix-name-tag}${var.panorama.name}" }, var.global_tags)
}

resource "aws_eip" "elasticip" {}

resource "aws_eip_association" "eip_assoc" {
  allocation_id = aws_eip.elasticip.id
  network_interface_id = aws_network_interface.private.id
}

locals {
  vpcs = {
    "${module.management-vpc.vpc_details.name}"  : module.management-vpc.vpc_details
  }
}

module "vpc-routes" {
  source          = "../modules/vpc_routes"
  vpc-routes      = var.management-vpc-routes
  vpcs            = local.vpcs
  prefix-name-tag = var.prefix-name-tag
}

output "PANORAMA_IP_ADDRESS" {
  value = aws_eip.elasticip.public_ip
}