# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes (vpc_module) - versions.tf
# ==============================================================================

# TODO: Define la versión mínima de Terraform y el proveedor de AWS.
# Pista: Debe ser compatible con la versión >= 1.5.0 de Terraform y ~> 5.0 del proveedor AWS.

terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
