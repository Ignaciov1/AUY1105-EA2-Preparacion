# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Orquestador Raíz - variables.tf
# ==============================================================================

variable "aws_region" {
  type        = string
  description = "Región de AWS para desplegar la infraestructura"
  default     = "us-east-1"
}

variable "environment" {
  type        = string
  description = "Nombre del ambiente de ejecución"
  default     = "desarrollo"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR para la red principal (VPC)"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "CIDR para la subred pública"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  type        = string
  description = "Tipo de instancia de cómputo EC2"
  default     = "t2.micro"
}
