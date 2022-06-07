
management-vpc = {
    name                 = "mgmt-vpc"
    cidr_block           = "10.4.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true
    internet_gateway     = true
}

management-vpc-route-tables = [
  { name = "rt", "subnet" = "subnet" }
]

management-vpc-subnets = [
  { name = "subnet", cidr = "10.4.1.0/24", az = "a" }
]

management-vpc-routes = {
  mgmt-out = {
    name          = "out"
    vpc_name      = "mgmt-vpc"
    route_table   = "rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "internet_gateway"
    next_hop_name = "igw"
  }
}

management-vpc-security-groups = [
  {
    name = "panorama-sg"
    rules = [
      {
        description = "Permit All traffic outbound"
        type        = "egress", from_port = "0", to_port = "0", protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit All HTTPS inbound traffic"
        type        = "ingress", from_port = "443", to_port = "443", protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit All SSH inbound traffic"
        type        = "ingress", from_port = "22", to_port = "22", protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit All SSH inbound traffic"
        type        = "ingress", from_port = "3978", to_port = "3978", protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      }
    ]
  }
]

panorama = {
  name              = "panorama"
  source_dest_check = true
  subnet_name       = "subnet"
  private_ips       = ["10.4.1.100"]
  security_group    = "panorama-sg"
  instance_type     = "c5.4xlarge"
  ami               = "ami-0f1a372841f68f319"
}
