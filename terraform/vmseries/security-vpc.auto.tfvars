
security-vpc = {
    name                 = "sec-vpc"
    cidr_block           = "10.3.0.0/16"
    instance_tenancy     = "default"
    enable_dns_support   = true
    enable_dns_hostnames = true
    internet_gateway     = true
}

security-vpc-route-tables = [
  { name = "ngfw-mgmt-rt", subnet = "ngfw-mgmt-subnet" },
  { name = "ngfw-data-rt", subnet = "ngfw-data-subnet" },
  { name = "natgw-rt", subnet = "natgw-subnet" },
  { name = "gwlbe-rt", subnet = "gwlbe-subnet" },
  { name = "tgw-rt", subnet = "tgw-subnet" }
]

security-vpc-routes = {
  sec-tgw-gwlbe-1 = {
    name          = "tgw-gwlbe-1"
    vpc_name      = "sec-vpc"
    route_table   = "tgw-rt"
    prefix        = "10.1.0.0/16"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  sec-tgw-gwlbe-2 = {
    name          = "tgw-gwlbe-2"
    vpc_name      = "sec-vpc"
    route_table   = "tgw-rt"
    prefix        = "10.2.0.0/16"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  sec-tgw-gwlbe-out = {
    name          = "tgw-gwlbe-out"
    vpc_name      = "sec-vpc"
    route_table   = "tgw-rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  sec-gwlbe-out = {
    name          = "gwlbe-out"
    vpc_name      = "sec-vpc"
    route_table   = "gwlbe-rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "nat_gateway"
    next_hop_name = "natgw"
  },
  sec-gwlbe-tgw-1 = {
    name          = "gwlbe-tgw-1"
    vpc_name      = "sec-vpc"
    route_table   = "gwlbe-rt"
    prefix        = "10.1.0.0/16"
    next_hop_type = "transit_gateway"
    next_hop_name = "tgw"
  },
  sec-gwlbe-tgw-2 = {
    name          = "gwlbe-tgw-2"
    vpc_name      = "sec-vpc"
    route_table   = "gwlbe-rt"
    prefix        = "10.2.0.0/16"
    next_hop_type = "transit_gateway"
    next_hop_name = "tgw"
  },
  sec-natgw-out = {
    name          = "natgw-out"
    vpc_name      = "sec-vpc"
    route_table   = "natgw-rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "internet_gateway"
    next_hop_name = "igw"
  },
  sec-natgw-gwlbe-1 = {
    name          = "natgw-gwlbe-1"
    vpc_name      = "sec-vpc"
    route_table   = "natgw-rt"
    prefix        = "10.1.0.0/16"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  sec-natgw-gwlbe-2 = {
    name          = "natgw-gwlbe-2"
    vpc_name      = "sec-vpc"
    route_table   = "natgw-rt"
    prefix        = "10.2.0.0/16"
    next_hop_type = "gateway_load_balancer_endpoint"
    next_hop_name = "gwlbe"
  },
  sec-ngfw-out = {
    name          = "ngfw-out"
    vpc_name      = "sec-vpc"
    route_table   = "ngfw-mgmt-rt"
    prefix        = "0.0.0.0/0"
    next_hop_type = "internet_gateway"
    next_hop_name = "igw"
  }
}

security-vpc-subnets = [
  { name = "ngfw-data-subnet", cidr = "10.3.1.0/24", az = "a" },
  { name = "ngfw-mgmt-subnet", cidr = "10.3.2.0/24", az = "a" },
  { name = "natgw-subnet", cidr = "10.3.3.0/24", az = "a" },
  { name = "gwlbe-subnet", cidr = "10.3.4.0/24", az = "a" },
  { name = "tgw-subnet", cidr = "10.3.0.0/24", az = "a" }
]

security-vpc-security-groups = [
  {
    name = "ngfw-data-sg"
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
      }
    ]
  },
  {
    name = "ngfw-mgmt-sg"
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
      }
    ]
  }
]

transit-gateway = {
  name     = "tgw"
  asn      = "64512"
  route_tables = {
    security = { name = "from-sec-vpc"}
    spoke    = { name = "from-app-vpcs"}
  }
}

transit-gateway-associations = {
  "sec-vpc" = "from-sec-vpc",
  "vul-vpc" = "from-app-vpcs",
  "att-vpc" = "from-app-vpcs"
}

transit-gateway-routes = {
  "sec-vpc-to-vul-vpc-route" = {
    route_table = "from-sec-vpc"
    vpc_name    = "vul-vpc"
    cidr_block  = "10.1.0.0/16"
  },
  "sec-vpc-to-att-vpc-route" = {
    route_table = "from-sec-vpc"
    vpc_name    = "att-vpc"
    cidr_block  = "10.2.0.0/16"
  },
  "app-vpcs-to-sec-vpc-route" = {
    route_table = "from-app-vpcs"
    vpc_name    = "sec-vpc"
    cidr_block  = "0.0.0.0/0"
  }
}

fw_version = "10.2.1"
fw_product_code = ["hd44w1chf26uv4p52cdynb2o"]

firewalls = [
  {
    name              = "vmseries01"
    instance_type     = "m5.xlarge"
    bootstrap_options = { "hostname" = "qwikLABS-vmseries01" }
    interfaces = [
      { name = "vmseries01-data", index = "0" },
      { name = "vmseries01-mgmt", index = "1" },
    ]
  }
]

firewall-bootstrap_options = {
  "mgmt-interface-swap" = "enable"
  "plugin-op-commands"  = "aws-gwlb-inspect:enable"
  "type"                = "dhcp-client"
  "tplname"             = "VM-tempstack"
  "dgname"              = "VM-DG"
  "vm-auth-key"         = "410447188942721"
}

firewall-interfaces = [
  {
    name              = "vmseries01-data"
    source_dest_check = false
    subnet_name       = "ngfw-data-subnet"
    private_ips       = ["10.3.1.100"]
    security_group    = "ngfw-data-sg"
  },
  {
    name              = "vmseries01-mgmt"
    source_dest_check = true
    subnet_name       = "ngfw-mgmt-subnet"
    private_ips       = ["10.3.2.100"]
    security_group    = "ngfw-mgmt-sg"
  }
]

nat_gateways = {
  sec-vpc-natgw = {
    name = "natgw", 
    subnet = "natgw-subnet"
  }
}

gateway_load_balancer = {
  name           = "security-gwlb"
  subnet_names   = ["ngfw-data-subnet"]
  firewall_names = ["vmseries01"]
  vpc            = "sec-vpc"
}

gateway_load_balancer_endpoints = {
  sec-vpc-gwlbe = {
    name                  = "sec-vpc-gwlbe"
    gateway_load_balancer = "security-gwlb"
    subnet_names          = ["gwlbe-subnet"]
    vpc                   = "sec-vpc"
  },
  att-vpc-gwlbe = {
    name                  = "att-vpc-gwlbe"
    gateway_load_balancer = "security-gwlb"
    subnet_names          = ["gwlbe-subnet"]
    vpc                   = "att-vpc"
  },
  vul-vpc-gwlbe = {
    name                  = "vul-vpc-gwlbe"
    gateway_load_balancer = "security-gwlb"
    subnet_names          = ["gwlbe-subnet"]
    vpc                   = "vul-vpc"
  }
}