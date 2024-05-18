resource "aws_subnet" "public_subnet" {
  vpc_id                  = var.vpc_id # Usa a variável passada
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "MinhaPublicSubnet"
    Owner = var.tag_owner
  }
}

# modules/subnet/main.tf
resource "aws_subnet" "private_subnet" {
  vpc_id                  = var.vpc_id # Usa a variável passada
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = false
  availability_zone       = "us-east-1b"

  tags = {
    Name = "MinhaPrivateSubnet"
    Owner = var.tag_owner
  }
}
