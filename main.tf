provider "aws" {
  region     = "us-east-2"
  access_key = "AKIA23WSSOBJ6QDBM7MO"
  secret_key = "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"
}

resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 tags = {
   Name = "VPC_terraform"
 }
}

resource "aws_subnet" "public_subnets" {
 count             = length(var.public_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count             = length(var.private_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
}

resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 tags = {
   Name = "Project VPC IG"
 }
}

resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.main.id
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 tags = {
   Name = "2nd Route Table"
 }
}

resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.second_rt.id
}

resource "aws_instance" "ec2_instance1" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.ami_key_pair_name
  associate_public_ip_address = true
  subnet_id     = element(aws_subnet.public_subnets[*].id, 1)
  tags = {
    Name = "terraform_public"
	}
}

resource "aws_instance" "ec2_instance2" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.ami_key_pair_name
  subnet_id     = element(aws_subnet.private_subnets[*].id, 1)
  tags = {
    Name = "terraform_private"
	}
}
