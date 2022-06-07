
resource "aws_route" "internet_gateway" {
  for_each = { 
    for k, route in var.vpc-routes: k => route
    if route.next_hop_type == "internet_gateway"
  }

  route_table_id         = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["vpc_route_tables"]["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.route_table}"]
  destination_cidr_block = each.value.prefix
  gateway_id             = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["internet_gateway"]["${var.prefix-name-tag}${each.value.vpc_name}-igw"]
}

resource "aws_route" "transit_gateway" {
  for_each = { 
    for k, route in var.vpc-routes: k => route
    if route.next_hop_type == "transit_gateway"
  }

  route_table_id         = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["vpc_route_tables"]["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.route_table}"]
  destination_cidr_block = each.value.prefix
  transit_gateway_id     = var.tgw-ids["${var.prefix-name-tag}${each.value.next_hop_name}"]
}

resource "aws_route" "network_interface" {
  for_each = { 
    for k, route in var.vpc-routes: k => route
    if route.next_hop_type == "network_interface"
  }

  route_table_id         = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["vpc_route_tables"]["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.route_table}"]
  destination_cidr_block = each.value.prefix
  network_interface_id   = var.ngfw-data-eni
}

resource "aws_route" "vpc_endpoint" {
  for_each = { 
    for k, route in var.vpc-routes: k => route
    if route.next_hop_type == "gateway_load_balancer_endpoint"
  }

  route_table_id         = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["vpc_route_tables"]["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.route_table}"]
  destination_cidr_block = each.value.prefix
  vpc_endpoint_id        = var.gwlbe_ids["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.next_hop_name}"]
}

resource "aws_route" "nat_gateway" {
  for_each = { 
    for k, route in var.vpc-routes: k => route
    if route.next_hop_type == "nat_gateway"
  }

  route_table_id          = var.vpcs["${var.prefix-name-tag}${each.value.vpc_name}"]["vpc_route_tables"]["${var.prefix-name-tag}${each.value.vpc_name}-${each.value.route_table}"]
  destination_cidr_block  = each.value.prefix
  nat_gateway_id          = var.natgw_ids["${var.prefix-name-tag}${each.value.next_hop_name}"]
}

output "vpc-routes" {
  value = var.vpc-routes
}