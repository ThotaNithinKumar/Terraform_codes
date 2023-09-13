variable "public_subnet_cidrs" {
	type        = list(string)
	description = "Public Subnet CIDR values"
	default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
	type        = list(string)
	description = "Private Subnet CIDR values"
	default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

variable "azs" {
	type        = list(string)
	description = "Availability Zones"
	default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}
variable "ami" {
    type = string
    default = "ami-0ccabb5f82d4c9af5"
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "ami_key_pair_name" {
    default = "key pair Linux"
}