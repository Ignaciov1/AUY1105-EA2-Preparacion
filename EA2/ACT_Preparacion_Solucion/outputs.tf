# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Solución Raíz - outputs.tf
# ==============================================================================

output "vpc_id" {
  description = "ID de la VPC creada por el módulo de redes"
  value       = module.vpc.vpc_id
}

output "servidor_web_ip" {
  description = "Dirección IP pública de la instancia EC2"
  value       = module.ec2.public_ip
}

output "servidor_web_dns" {
  description = "DNS pública de la instancia EC2"
  value       = module.ec2.public_dns
}
