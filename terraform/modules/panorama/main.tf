
resource "aws_network_interface" "private" {
  subnet_id       = var.subnet-ids["${var.vpc-name}-${var.panorama.subnet_name}"]
  private_ips     = var.panorama.private_ips
  security_groups = [var.security-groups["${var.prefix-name-tag}${var.panorama.security_group}"]]
  tags = merge({ Name = "${var.prefix-name-tag}${var.panorama.name}-primary-interface" }, var.global_tags)
}

resource "aws_instance" "this" {
  ami                         = var.panorama.ami
  instance_type               = var.panorama.instance_type
  key_name                    = var.ssh-key-name
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

output "PANORAMA_IP_ADDRESS" {
  value = aws_eip.elasticip.public_ip
}