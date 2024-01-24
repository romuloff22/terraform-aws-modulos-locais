resource "aws_vpc" "vpc" {
  cidr_block = var.cidr_vpc

  tags = {
    Name = "vpc-${var.environment}"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_subnet

  tags = {
    Name = "subnet-${var.environment}"
  }
}

resource "aws_internet_gateway" "internetgateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "igw-${var.environment}"
  }
}

resource "aws_route_table" "routetable" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internetgateway.id
  }

  tags = {
    Name = "rta-${var.environment}"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.routetable.id
}

resource "aws_security_group" "security_group" {
  name        = "security-group-${var.environment}"
  description = "Permitir acesso a porta 22"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "security_group-${var.environment}"
  }
}

