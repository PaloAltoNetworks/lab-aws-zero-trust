
variable "management-vpc" { default = {} }
variable "management-vpc-subnets" { default = [] }
variable "management-vpc-route-tables" { default = [] }
variable "management-vpc-security-groups" { default = [] }
variable "management-vpc-routes" { default = [] }
variable "panorama" { default = {} }

variable "prefix-name-tag" {}
variable "global_tags" {}