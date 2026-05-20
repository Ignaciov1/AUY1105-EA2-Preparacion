# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Cómputo (ec2_module) - variables.tf
# ==============================================================================

variable "instance_type" {
  type        = string
  description = "Tipo de instancia EC2"
  default     = "t2.micro"
}

# TODO: Define la variable 'subnet_id' que recibirá el ID de la subnet desde el módulo de red.
# Pista: No debe tener un valor 'default' porque es obligatorio que sea provisto por el orquestador raíz.
variable "subnet_id" {
  type        = string
  description = "ID de la Subnet donde se desplegará la instancia EC2"
}

# TODO: Define la variable 'security_group_id' que recibirá el ID del grupo de seguridad.
variable "security_group_id" {
  type        = string
  description = "ID del Grupo de Seguridad a asociar con la instancia EC2"
}

variable "environment" {
  type        = string
  description = "Ambiente de despliegue de la infraestructura"
  default     = "desarrollo"
}

variable "ami_id" {
  type        = string
  description = "ID de la AMI a utilizar"
  # Por defecto, una AMI genérica de Amazon Linux 2023 en us-east-1.
  default = "ami-0c7217cdde317cfec"
}

variable "key_name" {
  type        = string
  description = "Nombre de la clave para el acceso SSH (en AWS Academy suele ser 'vockey')"
  default     = "vockey"
}
