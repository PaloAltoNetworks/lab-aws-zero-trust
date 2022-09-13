
locals {
  subnet_ids = {
    for k, subnet in aws_subnet.this: 
      subnet.tags["Name"] => subnet.id
  }

  vpc_route_table_ids = {
    for k, route_table in aws_route_table.this:
      route_table.tags["Name"] => route_table.id
  }

  sg-ids = {
    for sg in aws_security_group.this:
      sg.name => sg.id
  }

  ec2-ids = {
    for k, instance in aws_instance.this:
      instance.tags["Name"] => instance.id
  }

  igw-id = {
    "${aws_internet_gateway.this.tags["Name"]}" : aws_internet_gateway.this.id
  }

  eni-ids = {
    for k, interface in aws_network_interface.private:
      interface.tags["Name"] => interface.id
  }

  natgw_ids = {
    for k, natgw in aws_nat_gateway.this:
      natgw.tags["Name"] => natgw.id
  }

  ec2-ips = {
    for k, address in aws_eip.ec2_eip:
      k => address.public_ip
  }
}

resource "aws_vpc" "this" {
  tags                 = merge({ Name = "${var.prefix-name-tag}${var.vpc.name}" }, var.global_tags)
  cidr_block           = var.vpc.cidr_block
  instance_tenancy     = var.vpc.instance_tenancy
  enable_dns_support   = var.vpc.enable_dns_support
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
}

resource "aws_internet_gateway" "this" {
  tags    = merge({ Name = "${var.prefix-name-tag}${var.vpc.name}-igw" }, var.global_tags)
  vpc_id  = aws_vpc.this.id
}

data "aws_region" "current" {}
data "aws_availability_zones" "available" { state = "available" }

resource "aws_subnet" "this" {
  for_each = { for subnet in var.subnets: subnet.name => subnet }

  cidr_block = each.value.cidr
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags = merge({ Name = "${var.prefix-name-tag}${var.vpc.name}-${each.value.name}" }, var.global_tags)
  vpc_id = aws_vpc.this.id
}

resource "aws_route_table" "this" {
  for_each = { for route in var.route-tables: route.name => route }
  vpc_id = aws_vpc.this.id
  tags = merge({ Name = "${var.prefix-name-tag}${var.vpc.name}-${each.value.name}" }, var.global_tags)
}

resource "aws_route_table_association" "sub_assoc" {
  for_each = { 
    for route in var.route-tables: route.name => route
    if lookup(route, "subnet", null) != null
  }

  subnet_id = local.subnet_ids["${var.prefix-name-tag}${var.vpc.name}-${each.value.subnet}"]
  route_table_id = local.vpc_route_table_ids["${var.prefix-name-tag}${var.vpc.name}-${each.value.name}"]
}

resource "aws_route_table_association" "edge_assoc" {
  for_each = { 
    for route in var.route-tables: route.name => route
    if lookup(route, "edge", null) != null
  }

  gateway_id     = aws_internet_gateway.this.id
  route_table_id = local.vpc_route_table_ids["${var.prefix-name-tag}${var.vpc.name}-${each.value.name}"]
}

resource "aws_security_group" "this" {
  for_each = { for k, v in var.security-groups: k => v }

  name     = "${var.prefix-name-tag}${each.value.name}"
  vpc_id   = aws_vpc.this.id

  dynamic "ingress" {
    for_each = [
      for rule in each.value.rules :
      rule
      if rule.type == "ingress"
    ]

    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = lookup(ingress.value, "description", "")
    }
  }

  dynamic "egress" {
    for_each = [
      for rule in each.value.rules :
      rule
      if rule.type == "egress"
    ]

    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = egress.value.cidr_blocks
      description = lookup(egress.value, "description", "")
    }
  }

  tags = merge({ Name = "${var.prefix-name-tag}${each.value.name}" }, var.global_tags)

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "latest_ecs" {
  most_recent = true
  owners = ["591542846629"] # AWS

  filter {
      name   = "name"
      values = ["*amazon-ecs-optimized"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}

data "aws_key_pair" "key_name" {
  filter {
    name = "key-name"
    values = ["qwikLABS-*"]
  }
}

resource "aws_network_interface" "private" {
  for_each = { for instance in var.ec2-instances: instance.name => instance }

  subnet_id       = local.subnet_ids["${var.prefix-name-tag}${var.vpc.name}-${each.value.subnet}"]
  private_ips     = each.value.private_ips
  security_groups = [local.sg-ids["${var.prefix-name-tag}${each.value.security_group}"]]
  tags = merge({ Name = "${var.prefix-name-tag}${each.value.name}-primary-interface" }, var.global_tags)
}

resource "aws_instance" "this" {
  for_each = { for instance in var.ec2-instances: instance.name => instance }

  ami                         = data.aws_ami.latest_ecs.id
  instance_type               = each.value.instance_type
  user_data                   = file("${path.module}/${each.value.setup-file}")
  key_name                    = data.aws_key_pair.key_name.key_name
  network_interface {
    network_interface_id = local.eni-ids["${var.prefix-name-tag}${each.value.name}-primary-interface"]
    device_index = 0
  }

  tags = merge({ Name = "${var.prefix-name-tag}${each.value.name}" }, var.global_tags)
}

resource "aws_eip" "ec2_eip" {
  for_each = { for key, instance in aws_instance.this: key => instance }

  instance = each.value.id
  #tags = merge({ Name = "${var.prefix-name-tag}${each.value.name}-eip" }, var.global_tags)
  vpc = true
}

resource "aws_eip" "natgw_eip" {
  for_each = var.nat_gateways

  tags = merge({ Name = "${var.prefix-name-tag}${each.value.name}-eip" }, var.global_tags)
  vpc = true
}

resource "aws_nat_gateway" "this" {
  for_each = var.nat_gateways

  allocation_id = aws_eip.natgw_eip[each.key].id
  subnet_id     = local.subnet_ids["${var.prefix-name-tag}${var.vpc.name}-${each.value.subnet}"]
  tags          = merge({ Name = "${var.prefix-name-tag}${each.value.name}" }, var.global_tags)
}

output "vpc_details" {
  value = {
    "id"              : aws_vpc.this.id
    "name"            : aws_vpc.this.tags["Name"]
    "internet_gateway": local.igw-id
    "subnet_ids"      : local.subnet_ids
    "vpc_route_tables": local.vpc_route_table_ids
    "security-groups" : local.sg-ids
    "instance"        : local.ec2-ids
  }
}

output "ssh_key_name" {
  value = data.aws_key_pair.key_name.key_name
}

output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_name" {
  value = aws_vpc.this.tags["Name"]
}

output "igw_id" {
  value = local.igw-id
}

output "subnet_ids" {
  value = local.subnet_ids
}

output "vpc_route_tables" {
  value = local.vpc_route_table_ids
}

output "security_groups" {
  value = local.sg-ids
}

output "instance_ids" {
  value = local.ec2-ids
}

output "natgw_ids" {
  value = local.natgw_ids
}

output "instance_ips" {
  value = local.ec2-ips
}
