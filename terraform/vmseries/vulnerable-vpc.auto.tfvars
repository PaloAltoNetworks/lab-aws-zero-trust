
vulnerable-vpc = {
  name                 = "vul-vpc"
  cidr_block           = "10.1.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  internet_gateway     = true
}

vulnerable-vpc-route-tables = [
  { name = "rt", "subnet" = "subnet" },
  { name = "igw-rt", "edge" = "igw" },
  { name = "gwlbe-rt", "subnet" = "gwlbe-subnet" }
]

vulnerable-vpc-subnets = [
  { name = "subnet", cidr = "10.1.1.0/24", az = "a" },
  { name = "gwlbe-subnet", cidr = "10.1.2.0/24", az = "a" },
  { name = "tgw-subnet", cidr = "10.1.0.0/24", az = "a" }
]

vulnerable-vpc-security-groups = [
  {
    name = "vul-svr-sg"
    rules = [
      {
        description = "Permit All traffic outbound"
        type        = "egress", from_port = "0", to_port = "0", protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit All Internal traffic"
        type        = "ingress", from_port = "0", to_port = "0", protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit Port 8080"
        type        = "ingress", from_port = "8080", to_port = "8080", protocol = "tcp"
        cidr_blocks = ["10.2.0.0/16"]
      },
      {
        description = "Permit Port 22 Public"
        type        = "ingress", from_port = "22", to_port = "22", protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
      },
      {
        description = "Permit ICMP Public"
        type        = "ingress", from_port = "0", to_port = "0", protocol = "icmp"
        cidr_blocks = ["10.2.0.0/16"]
      }
    ]
  }
]

vulnerable-vpc-instances = [
  {
    name           = "vul-app-server"
    instance_type  = "t2.micro"
    subnet         = "subnet"
    setup-file     = "ec2-startup-scripts/log4j-vul-svr.sh"
    private_ips    = ["10.1.1.100"]
    security_group = "vul-svr-sg"
  }
]

vulnerable-vpc-routes = {
  vul-edge-gwlbe = {
    name          = "edge-gwlbe"
    vpc_name      = "vul-vpc"
    route_table   = "igw-rt"
    prefix        = "10.1.1.0/24"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  vul-gwlbe-out = {
    name          = "gwlbe-out"
    vpc_name      = "vul-vpc"
    route_table   = "gwlbe-rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "internet_gateway"
    next_hop_name = "igw"
  },
  vul-app-tgw = {
    name          = "app-tgw"
    vpc_name      = "vul-vpc"
    route_table   = "rt"
    prefix        = "10.2.0.0/16"
    next_hop_type = "transit_gateway"
    next_hop_name = "tgw"
  },
  vul-app-gwlbe = {
    name          = "vul-app-gwlbe"
    vpc_name      = "vul-vpc"
    route_table   = "rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  }
}