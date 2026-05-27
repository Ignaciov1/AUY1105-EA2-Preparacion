# ==============================================================================
# AUY1105 - Infraestructura como Código II
# Experiencia de Aprendizaje 2 (EA2)
# Actividad: Preparación Evaluación Parcial 2
# ------------------------------------------------------------------------------
# Módulo de Cómputo (ec2_module) - main.tf
# ==============================================================================

# 1. Creación de la Instancia EC2
resource "aws_instance" "web" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = var.key_name

  # Provisionamiento de un Servidor Web mediante User Data (Versión Ubuntu + UTF-8)
  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              DEBIAN_FRONTEND=noninteractive apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              
              # Eliminamos la página por defecto de Ubuntu
              rm -f /var/www/html/index.html
              
              # Creamos el sitio personalizado con estructura HTML y codificación UTF-8
              echo "<!DOCTYPE html>" > /var/www/html/index.html
              echo "<html lang=\"es\">" >> /var/www/html/index.html
              echo "<head>" >> /var/www/html/index.html
              echo "    <meta charset=\"UTF-8\">" >> /var/www/html/index.html
              echo "    <title>Servidor Web Terraform</title>" >> /var/www/html/index.html
              echo "</head>" >> /var/www/html/index.html
              echo "<body>" >> /var/www/html/index.html
              echo "    <h1>Preparación EP2: Despliegue Exitoso en AWS Academy</h1>" >> /var/www/html/index.html
              echo "    <p>Servidor web configurado dinámicamente mediante Terraform y modularización - DuocUC</p>" >> /var/www/html/index.html
              echo "</body>" >> /var/www/html/index.html
              echo "</html>" >> /var/www/html/index.html
              EOF

  tags = {
    Name        = "Servidor-Web-${var.environment}"
    Environment = var.environment
    Owner       = "ig.sariego@duocuc.cl"
  }
}