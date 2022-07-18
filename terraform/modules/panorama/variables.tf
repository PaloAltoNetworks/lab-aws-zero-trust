
variable "vpc-name" { default = "" }
variable "subnet-ids" { default = [] }
variable "security-groups" { default = [] }
variable "ssh-key-name" { default = "" }
variable "panorama" { default = {} }

variable "prefix-name-tag" {}
variable "global_tags" {}