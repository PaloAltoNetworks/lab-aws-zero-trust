
module "vulnerable-vpc" {
  source           = "../modules/vpc"
  vpc              = var.vulnerable-vpc
  prefix-name-tag  = var.prefix-name-tag
  subnets          = var.vulnerable-vpc-subnets
  route-tables     = var.vulnerable-vpc-route-tables
  security-groups  = var.vulnerable-vpc-security-groups
  ec2-instances    = var.vulnerable-vpc-instances
  global_tags      = var.global_tags

  providers = {
    aws = aws.default
  }
}

module "attack-vpc" {
  source          = "../modules/vpc"
  vpc             = var.attack-vpc
  prefix-name-tag = var.prefix-name-tag
  subnets         = var.attack-vpc-subnets
  route-tables    = var.attack-vpc-route-tables
  ec2-instances   = var.attack-vpc-instances
  security-groups = var.attack-vpc-security-groups
  global_tags     = var.global_tags

  providers = {
    aws = aws.default
  }
}

module "security-vpc" {
  source          = "../modules/vpc"
  vpc             = var.security-vpc
  prefix-name-tag = var.prefix-name-tag
  subnets         = var.security-vpc-subnets
  route-tables    = var.security-vpc-route-tables
  security-groups = var.security-vpc-security-groups
  nat_gateways    = var.nat_gateways
  global_tags     = var.global_tags

  providers = {
    aws = aws.default
  }
}

module "management-vpc" {
  source          = "../modules/vpc"
  vpc             = var.management-vpc
  prefix-name-tag = var.prefix-name-tag
  subnets         = var.management-vpc-subnets
  route-tables    = var.management-vpc-route-tables
  security-groups = var.management-vpc-security-groups
  global_tags     = var.global_tags

  providers = {
    aws = aws.us-east-1
  }
}

module "panorama" {
  source          = "../modules/panorama"
  vpc-name        = module.management-vpc.vpc_name
  subnet-ids      = module.management-vpc.subnet_ids
  security-groups = module.management-vpc.security_groups
  ssh-key-name    = module.management-vpc.ssh_key_name
  panorama        = var.panorama
  prefix-name-tag = var.prefix-name-tag
  global_tags     = var.global_tags

  providers = {
    aws = aws.us-east-1
  }
}

module "vm-series" {
  source            = "../modules/vm-series"
  fw_product_code   = var.fw_product_code
  fw_version        = var.fw_version
  firewalls         = var.firewalls
  fw_interfaces     = var.firewall-interfaces
  ssh_key_name      = module.security-vpc.ssh_key_name
  prefix-name-tag   = var.prefix-name-tag
  vpc_name          = module.security-vpc.vpc_name
  subnet_ids        = module.security-vpc.subnet_ids
  security_groups   = module.security-vpc.security_groups
  bootstrap_options = var.firewall-bootstrap_options
  panorama_ip       = module.panorama.PANORAMA_IP_ADDRESS
  global_tags       = var.global_tags

  providers = {
    aws = aws.default
  }
}

locals {
  vpcs = {
    "${module.vulnerable-vpc.vpc_details.name}"  : module.vulnerable-vpc.vpc_details,
    "${module.attack-vpc.vpc_details.name}"      : module.attack-vpc.vpc_details,
    "${module.security-vpc.vpc_details.name}"    : module.security-vpc.vpc_details,
    "${module.management-vpc.vpc_details.name}"  : module.management-vpc.vpc_details
  }
}

module "gwlb" {
  source                = "../modules/gwlb"
  gateway_load_balancer = var.gateway_load_balancer
  gateway_load_balancer_endpoints = var.gateway_load_balancer_endpoints
  firewall              = module.vm-series.firewall
  subnets_map           = module.security-vpc.subnet_ids
  sec_vpc_id            = module.security-vpc.vpc_id
  vpcs                  = local.vpcs
  prefix_name_tag       = var.prefix-name-tag
  global_tags           = var.global_tags

  providers = {
    aws = aws.default
  }
}

module "transit-gateway" {
  source          = "../modules/transit-gateway"
  transit-gateway = var.transit-gateway
  prefix-name-tag = var.prefix-name-tag
  global_tags     = var.global_tags
  vpcs            = local.vpcs
  transit-gateway-associations = var.transit-gateway-associations
  transit-gateway-routes       = var.transit-gateway-routes

  providers = {
    aws = aws.default
  }
}

module "vpc-routes" {
  source          = "../modules/vpc_routes"
  vpc-routes      = merge(var.vulnerable-vpc-routes, var.attack-vpc-routes, var.security-vpc-routes)
  vpcs            = local.vpcs
  tgw-ids         = module.transit-gateway.tgw-ids
  ngfw-data-eni   = module.vm-series.ngfw-data-eni
  gwlbe_ids       = module.gwlb.gwlbe_ids
  natgw_ids       = module.security-vpc.natgw_ids
  prefix-name-tag = var.prefix-name-tag

  providers = {
    aws = aws.default
  }
}

module "vpc-routes-mgmt" {
  source          = "../modules/vpc_routes"
  vpc-routes      = var.management-vpc-routes
  vpcs            = local.vpcs
  prefix-name-tag = var.prefix-name-tag

  providers = {
    aws = aws.us-east-1
  }
}