variable "subnet_public_cidrs" {
  type=string
  description = "Public Subnet CIDR values"
  default = [ "10.0.0.0/16"]
  
}

variable "subnet_private_cidrs" {
  type=string
  description = "Private Subnet CIDR values"
  default = [ "10.0.0.0/16" ]

  
}
