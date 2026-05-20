# AUY1105 - INFRAESTRUCTURA COMO CÓDIGO II
## Experiencia de Aprendizaje 2 (EA2)
### **Solución de Referencia - Actividad de Preparación EP2**

---

## 1. DESCRIPCIÓN DE LA SOLUCIÓN
Este directorio contiene la solución **100% resuelta y funcional** para la actividad práctica de preparación. Sirve como punto de referencia para que el docente valide las implementaciones o para que los alumnos autoevalúen su progreso.

A diferencia de la plantilla del estudiante, aquí se han resuelto todos los bloques `TODO`:
- Se completó la vinculación del Internet Gateway a la VPC.
- Se configuró la ruta por defecto (`0.0.0.0/0`) en la tabla de ruteo apuntando al Internet Gateway.
- Se implementó la regla de entrada de HTTP en el grupo de seguridad (puerto `80`).
- Se expusieron correctamente los outputs del módulo de red (`public_subnet_id`, `security_group_id`) y se inyectaron dinámicamente en el módulo de cómputo.
- Se configuraron los outputs globales de la raíz para obtener la IP pública y DNS pública de la instancia de forma dinámica.

---

## 2. INSTRUCCIONES DE DESPLIEGUE

Para desplegar esta solución directamente con fines demostrativos o de pruebas:

1. **Configurar Credenciales**:
   Asegúrate de que tus credenciales de AWS Academy Learner Lab estén activas y configuradas en tu consola o archivo local `~/.aws/credentials`.

2. **Crear Variables Locales**:
   Copia el archivo de ejemplo:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   *(Opcional)* Edita el archivo `terraform.tfvars` para modificar el nombre del ambiente.

3. **Ejecutar el Ciclo de Vida de Terraform**:
   Ejecuta los siguientes comandos dentro de esta carpeta (`ACT_Preparacion_Solucion/`):
   ```bash
   terraform init
   terraform validate
   terraform plan
   terraform apply --auto-approve
   ```

4. **Validación**:
   Una vez completado el despliegue, copia la dirección IP pública mostrada en el output `servidor_web_ip` y ábrela en un navegador para comprobar que el servidor de Apache responde correctamente con la página corporativa de DuocUC.

5. **Limpieza**:
   Una vez terminada la demostración, no olvides destruir los recursos para no consumir créditos del Learner Lab:
   ```bash
   terraform destroy --auto-approve
   ```
