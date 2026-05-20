# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Redes (vpc_module) - outputs.tf
# ==============================================================================

output "vpc_id" {
  description = "ID de la VPC creada"
  value       = aws_vpc.main.id
}

# TODO: Define el output 'public_subnet_id' para exportar el ID de la subnet pública.
# Pista: Debe apuntar al ID de la subnet pública para que sea utilizado por el módulo de cómputo.
output "public_subnet_id" {
  description = "ID de la Subnet publica creada"
  value       = aws_subnet.public.id
}

# TODO: Define el output 'security_group_id' para exportar el ID del grupo de seguridad.
# Pista: Es necesario para asociarlo a la instancia EC2.
output "security_group_id" {
  description = "ID del Grupo de Seguridad creado"
  value       = aws_security_group.web_sg.id
}
