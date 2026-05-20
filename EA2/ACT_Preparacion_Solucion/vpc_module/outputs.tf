# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes Resuelto (vpc_module) - outputs.tf
# ==============================================================================

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

output "public_subnet_id" {
  description = "ID de la Subnet publica creada"
  value       = aws_subnet.public.id
}

output "security_group_id" {
  description = "ID del Grupo de Seguridad creado"
  value       = aws_security_group.web_sg.id
}
