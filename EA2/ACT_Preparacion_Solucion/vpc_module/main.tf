# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes Resuelto (vpc_module) - main.tf
# ==============================================================================

# 1. Creación de la VPC
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name        = "VPC-${var.environment}"
    Environment = var.environment
  }
}

# 2. Creación de la Subnet Pública
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name        = "Subnet-Publica-${var.environment}"
    Environment = var.environment
  }
}

# 3. Creación del Internet Gateway (IGW)
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "IGW-${var.environment}"
    Environment = var.environment
  }
}

# 4. Creación de la Tabla de Ruteo Pública (Route Table)
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name        = "RouteTable-Publica-${var.environment}"
    Environment = var.environment
  }
}

# 5. Asociación de la Tabla de Ruteo con la Subnet Pública
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

# 6. Grupo de Seguridad (Security Group)
resource "aws_security_group" "web_sg" {
  name        = "sg_web_${var.environment}"
  description = "Grupo de seguridad para el servidor web y acceso SSH"
  vpc_id      = aws_vpc.main.id

  # Regla SSH
  ingress {
    description = "Acceso SSH desde cualquier IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla HTTP
  ingress {
    description = "Acceso HTTP desde cualquier IP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Regla Egress (Salida)
  egress {
    description = "Salida libre hacia Internet"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "SG-Web-${var.environment}"
    Environment = var.environment
  }
}
