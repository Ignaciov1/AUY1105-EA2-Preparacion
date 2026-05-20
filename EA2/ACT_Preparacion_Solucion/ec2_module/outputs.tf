# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Cómputo Resuelto (ec2_module) - outputs.tf
# ==============================================================================

output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Dirección IP pública del servidor web"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "DNS pública asociada a la instancia EC2"
  value       = aws_instance.web.public_dns
}
