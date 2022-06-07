
variable "fw_version" {}
variable "fw_product_code" {}
variable "fw_interfaces" {}
variable "firewalls" {}
variable "ssh_key_name" {}
variable "prefix-name-tag" {}
variable "global_tags" {}
variable "subnet_ids" {}
variable "security_groups" {}
variable "vpc_name" {}
#variable "panorama" {}
variable "panorama_ip" { default = "" }
variable "authcodes" { default = [] }
variable "bootstrap_options" {}