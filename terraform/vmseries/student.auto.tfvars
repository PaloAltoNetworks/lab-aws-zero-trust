############################################################
# Make sure to fill in the values for access-key, secret-key
# and region before running the terraform.
############################################################
access-key      = ""
secret-key      = ""
region          = ""

prefix-name-tag     = "qwikLABS-"               # Feel free to modify this if required. This prefix is just meant to make the lab resources identifiable

global_tags         = {
  # The tags added below are specific to Palo Alto Networks. You can modify the tags as applicable for your use-case.
  managedBy   = "Terraform"
  application = "Palo Alto Networks Zero Trust QwikLab"
  owner       = "Palo Alto Networks - Software NGFW Products Team"
}