# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Solución Raíz - main.tf
# ==============================================================================

# 1. Invocación del Módulo de Redes
module "vpc" {
  source = "./vpc_module"

  vpc_cidr    = var.vpc_cidr
  subnet_cidr = var.subnet_cidr
  environment = var.environment
}

# 2. Invocación del Módulo de Cómputo
module "ec2" {
  source = "./ec2_module"

  instance_type     = var.instance_type
  environment       = var.environment
  subnet_id         = module.vpc.public_subnet_id
  security_group_id = module.vpc.security_group_id
}
