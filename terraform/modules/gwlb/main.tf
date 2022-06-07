
locals {
  gwlb_ids = {
    "${aws_lb.this.tags["Name"]}" : aws_lb.this.id
  }

  gwlbe_ids = {
    for k, gwlbe in aws_vpc_endpoint.this: 
      gwlbe.tags["Name"] => gwlbe.id
  }
}

resource "aws_lb_target_group" "this" {
  protocol    = "GENEVE"
  vpc_id      = var.sec_vpc_id
  target_type = "instance"
  port        = "6081"
  name        = "${var.prefix_name_tag}${var.gateway_load_balancer.name}"
  health_check {
    port     = "80"
    protocol = "TCP"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  target_group_arn = aws_lb_target_group.this.arn
  target_id        = var.firewall.id
}

resource "aws_lb" "this" {
  name               = "${var.prefix_name_tag}${var.gateway_load_balancer.name}"
  load_balancer_type = "gateway"
  subnets = [
    for subnet in var.gateway_load_balancer.subnet_names :
    var.subnets_map["${var.prefix_name_tag}${var.gateway_load_balancer.vpc}-${subnet}"]
  ]
  enable_cross_zone_load_balancing = true
  lifecycle {
    create_before_destroy = true
  }

  tags = merge({ Name = "${var.prefix_name_tag}${var.gateway_load_balancer.name}" }, var.global_tags)
}

resource "aws_lb_listener" "this" {
  load_balancer_arn = aws_lb.this.arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

resource "aws_vpc_endpoint_service" "this" {
  acceptance_required = false
  #allowed_principals         = lookup(each.value, "allowed_principals", null) #["arn:aws:iam::632512868473:root"]
  gateway_load_balancer_arns = [aws_lb.this.arn]
  tags                       = merge({ Name = "${var.prefix_name_tag}${var.gateway_load_balancer.name}" }, var.global_tags)
}

resource "aws_vpc_endpoint" "this" {
  for_each          = var.gateway_load_balancer_endpoints
  service_name      = aws_vpc_endpoint_service.this.service_name
  vpc_endpoint_type = aws_vpc_endpoint_service.this.service_type
  vpc_id            = var.vpcs["${var.prefix_name_tag}${each.value.vpc}"].id
  subnet_ids = [
    for subnet in each.value.subnet_names:
    var.vpcs["${var.prefix_name_tag}${each.value.vpc}"].subnet_ids["${var.prefix_name_tag}${each.value.vpc}-${subnet}"]
  ]
  tags = merge({ Name = "${var.prefix_name_tag}${each.value.name}" }, var.global_tags)
}

output "gwlb_ids" {
  value = local.gwlb_ids
}

output "gwlbe_ids" {
  value = local.gwlbe_ids
}