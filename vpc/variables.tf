variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  #default     = "10.0.0.0/16"
}

variable "public_Snet_cidr" {
  description = "The CIDR block for the Public Subnet."
  type        = string
  #default     = "10.0.1.0/16"
}

variable "private_Snet_cidr" {
  description = "The CIDR block for the Private Subnet."
  type        = string
  #default     = "10.0.2.0/16"
}


variable "availability_zone" {
  description = "The availability zone for the subnets"
  type        = string
  #default     = "us-east-1"
}