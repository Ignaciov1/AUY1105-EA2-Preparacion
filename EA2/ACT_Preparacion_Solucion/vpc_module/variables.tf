# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes Resuelto (vpc_module) - variables.tf
# ==============================================================================

variable "vpc_cidr" {
  type        = string
  description = "Rango de direcciones CIDR para la VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  type        = string
  description = "Rango de direcciones CIDR para la Subnet pública"
  default     = "10.0.1.0/24"
}

variable "availability_zone" {
  type        = string
  description = "Zona de disponibilidad para la subnet pública"
  default     = "us-east-1a"
}

variable "environment" {
  type        = string
  description = "Ambiente de despliegue de la infraestructura"
  default     = "desarrollo"
}
