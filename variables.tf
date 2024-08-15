variable "subnet_public_cidrs" {
  type=list(string)
  description = "Public Subnet CIDR values"
  default = [ "10.0.0.0/16", "10.0.1.0/16", "10.0.2.0/16","10.0.3.0/16","10.0.4.0/16","10.0.5.0/16" ]
  
}

variable "subnet_private_cidrs" {
  type=list(string)
  description = "Private Subnet CIDR values"
  default = [ "10.0.0.0/16", "10.0.1.0/16", "10.0.2.0/16","10.0.3.0/16","10.0.4.0/16","10.0.5.0/16" ]

  
}
#AZS --> Availability Zones
variable "azs" {
  type=list(string)
  description = "Availability Zones"
  default = [ "us-east-1a","us-east-1b","us-east-1c","us-east-1d","us-east-1e","us-east-1f" ]
  
}
