# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Cómputo (ec2_module) - outputs.tf
# ==============================================================================

# TODO: Define el output 'instance_id' para exportar el ID del servidor web.
output "instance_id" {
  description = "ID de la instancia EC2 creada"
  value       = aws_instance.web.id
}

# TODO: Define el output 'public_ip' para exportar la dirección IP pública.
# Pista: Es muy útil para verificar y probar el servidor web desde el navegador.
output "public_ip" {
  description = "Dirección IP pública del servidor web"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "DNS pública asociada a la instancia EC2"
  value       = aws_instance.web.public_dns
}
