# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes (vpc_module) - variables.tf
# ==============================================================================

variable "vpc_cidr" {
  type        = string
  description = "Rango de direcciones CIDR para la VPC"
  default     = "10.0.0.0/16"
}

# TODO: Define la variable para el CIDR de la Subnet pública.
# Debe tener el tipo string, una descripción adecuada y por defecto "10.0.1.0/24".
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

# TODO: Define una variable para el nombre del entorno (ej. 'desarrollo', 'produccion')
# Esta variable servirá para etiquetar dinámicamente los recursos (Tags).
variable "environment" {
  type        = string
  description = "Ambiente de despliegue de la infraestructura"
  default     = "desarrollo"
}
