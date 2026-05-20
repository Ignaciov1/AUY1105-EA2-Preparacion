# AUY1105 - INFRAESTRUCTURA COMO CÓDIGO II
## Experiencia de Aprendizaje 2: Modularización en Multi-Nube
### **Actividad de Preparación - Evaluación Parcial 2**

---

## 1. ANTECEDENTES GENERALES

En el ciclo de desarrollo actual, mantener configuraciones monolíticas en Terraform ("todo en un solo archivo `main.tf`") introduce graves riesgos operativos: aumenta la probabilidad de colisiones de código, dificulta la reutilización de infraestructura y complejiza la auditoría de seguridad. 

Esta actividad práctica tiene como objetivo entrenar el diseño de infraestructura modularizada en AWS. Como ingenieros Cloud, desacoplaremos la infraestructura en dos módulos independientes (Redes y Cómputo) y los orquestaremos de forma centralizada en un archivo raíz.

```text
                               +----------------------------+
                               |      Orquestador Raíz      |
                               |    (main.tf / variables)   |
                               +--------------+-------------+
                                              |
                       +----------------------+----------------------+
                       |                                             |
         +-------------v-------------+                 +-------------v-------------+
         |   Módulo Redes (VPC)      |                 |   Módulo Cómputo (EC2)    |
         |  - Subnet pública y SGs   |                 |  - Instancia y Servidor   |
         |  - Retorna ID subnet y SG +----------------->  - Recibe subnet_id y SG  |
         +---------------------------+                 +---------------------------+
```

---

## 2. REQUERIMIENTOS
Para llevar a cabo esta actividad, cada estudiante requiere:
1. **Acceso a AWS Academy**: Credenciales activas para el módulo *Learner Lab* (us-east-1).
2. **Terraform CLI**: Versión mínima `>= 1.5.0` instalada localmente.
3. **AWS CLI**: Configurado con las credenciales temporales activas provistas por la consola de AWS Academy (*AWS Details*).
4. Un editor de código (ej. **VS Code**).

---

## 3. DESARROLLO DE LA ACTIVIDAD

La actividad consta de **5 fases secuenciales**. A lo largo de la estructura del proyecto verás bloques comentados con la etiqueta `TODO:`. Tu misión es completarlos con la sintaxis correcta de Terraform (HCL).

### Estructura de Trabajo
```text
ACT_Preparacion/
├── README.md                   # Esta guía interactiva
├── main.tf                     # Orquestador principal (Llama a los módulos)
├── variables.tf                # Variables del orquestador principal
├── outputs.tf                  # Outputs que verás en pantalla al terminar
├── versions.tf                 # Configuración del proveedor de AWS
├── terraform.tfvars.example    # Ejemplo de valores de variables
├── CHANGELOG.md                # Bitácora de cambios (Versionamiento Semántico)
│
├── vpc_module/                 # MÓDULO DE REDES
│   ├── main.tf                 # Define VPC, Subnets, IGW, Route Tables y SG
│   ├── variables.tf            # Variables de entrada del módulo
│   └── outputs.tf              # Valores de salida expuestos al exterior
│
└── ec2_module/                 # MÓDULO DE CÓMPUTO
    ├── main.tf                 # Define Instancia EC2 con Apache (User Data)
    ├── variables.tf            # Variables de entrada del módulo
    └── outputs.tf              # Valores de salida expuestos al exterior
```

---

### **Fase 1: Preparación del Entorno en AWS Academy**
1. Inicia sesión en **AWS Academy** y arranca tu **Learner Lab**.
2. Haz clic en **AWS Details** y copia las credenciales temporales (`aws_access_key_id`, `aws_secret_access_key`, `aws_session_token`).
3. Crea un archivo en tu máquina local en la ruta del usuario: `~/.aws/credentials` (Linux/Mac) o `C:\Users\<Usuario>\.aws\credentials` (Windows) y pega las credenciales temporales.

---

### **Fase 2: Completar el Módulo de Redes (`vpc_module`)**
Accede a la carpeta `vpc_module/` y realiza las siguientes tareas guiadas por los comentarios `TODO`:
1. **`variables.tf`**: Define la variable `subnet_cidr` con su descripción y valor por defecto `"10.0.1.0/24"`.
2. **`main.tf`**:
   - Completa el recurso `aws_internet_gateway` enlazándolo a la VPC creada (`aws_vpc.main.id`).
   - Configura la tabla de ruteo `aws_route_table.public` para que dirija el tráfico `0.0.0.0/0` al gateway de internet.
   - Modifica el recurso `aws_security_group.web_sg` agregando la regla entrante de HTTP en el puerto `80`.
3. **`outputs.tf`**: Exporta los outputs obligatorios `public_subnet_id` y `security_group_id`.

---

### **Fase 3: Completar el Módulo de Cómputo (`ec2_module`)**
Accede a la carpeta `ec2_module/` y completa los bloques pendientes:
1. **`variables.tf`**: Declara las variables de entrada `subnet_id` y `security_group_id`. *¡Recuerda no asignarles un bloque 'default', pues el orquestador raíz las inyectará dinámicamente!*
2. **`main.tf`**: Declara el recurso `aws_instance.web` parametrizando la AMI (`var.ami_id`), tipo de instancia (`var.instance_type`), subred (`var.subnet_id`) y grupo de seguridad (`[var.security_group_id]`). El bloque *User Data* ya está configurado para levantar Apache automáticamente.
3. **`outputs.tf`**: Exporta la IP pública de la instancia (`public_ip`) para realizar la verificación web posterior.

---

### **Fase 4: Configurar y Desplegar el Orquestador Raíz**
En la carpeta raíz de tu actividad (`ACT_Preparacion/`):
1. Copia el archivo `terraform.tfvars.example` como `terraform.tfvars` y personaliza el valor de `environment` (ej. `"preparacion-tu_nombre"`).
2. Abre `main.tf` y realiza la invocación de ambos módulos:
   - Inyecta los CIDRs del orquestador al módulo de red.
   - Vincula el módulo de cómputo pasándole de forma dinámica las salidas del módulo de red:
     ```hcl
     subnet_id         = module.vpc.public_subnet_id
     security_group_id = module.vpc.security_group_id
     ```
3. Ejecuta los comandos del ciclo de vida de Terraform en la terminal:
   ```bash
   terraform init
   terraform validate
   terraform plan
   terraform apply --auto-approve
   ```

---

### **Fase 5: Verificación de la Infraestructura**
1. Al completarse el despliegue de forma exitosa, la consola te mostrará un output similar a:
   ```text
   Outputs:
   servidor_web_ip = "54.210.14.89"
   servidor_web_dns = "ec2-54-210-14-89.compute-1.amazonaws.com"
   vpc_id = "vpc-0abc123def456"
   ```
2. Copia la dirección IP entregada por la terminal y pégala en tu navegador. Deberías visualizar el siguiente mensaje corporativo:
   > **Preparación EP2: Despliegue Exitoso en AWS Academy**
   > Servidor web configurado dinámicamente mediante Terraform y modularización - DuocUC

---

## 4. TRABAJO AUTÓNOMO (DESAFÍO PRE-EVALUACIÓN)

Para emular los criterios de exigencia de la **Evaluación Parcial 2**, realiza de forma independiente los siguientes ajustes:
1. **Tags Personalizados**: Modifica los recursos para añadir una etiqueta `"Owner"` que almacene tu correo institucional.
2. **SemVer & Changelog**: Modifica la versión del proyecto de `0.1.0` a `0.2.0` en el archivo `CHANGELOG.md` detallando las modificaciones autónomas introducidas por ti.

---

## 5. REFLEXIONES Y PREGUNTAS CLAVE

Responde mentalmente o con tus compañeros las siguientes interrogantes al finalizar la guía:
* ¿Por qué es un error de diseño hardcodear el ID de una subnet dentro de un módulo de cómputo?
* Si destruyes el módulo de cómputo (`terraform destroy -target=module.ec2`), ¿qué sucede con la base de red configurada en `vpc_module`? ¿Por qué es útil este comportamiento en entornos empresariales?
* ¿Qué mejoras operativas aporta el versionado semántico en repositorios de infraestructura compartida?
