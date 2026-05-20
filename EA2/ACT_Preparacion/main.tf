# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Orquestador Raíz - main.tf
# ==============================================================================

# 1. Invocación del Módulo de Redes (VPC, Subnets, SG, IGW)
# TODO: Completa la llamada al módulo pasándole las variables necesarias.
# Pista: Revisa la carpeta './vpc_module' y utiliza las variables definidas en la raíz.
module "vpc" {
  source = "./vpc_module"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  environment = var.environment
}

# 2. Invocación del Módulo de Cómputo (Instancia EC2 con Apache)
# TODO: Vincula este módulo con el módulo de red (vpc) usando sus outputs.
# Pista: Necesitarás pasarle 'subnet_id' y 'security_group_id' que exporta el módulo vpc.
module "ec2" {
  source = "./ec2_module"

  instance_type = var.instance_type
  environment   = var.environment

  # Outputs obtenidos dinámicamente desde el módulo vpc:
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}
