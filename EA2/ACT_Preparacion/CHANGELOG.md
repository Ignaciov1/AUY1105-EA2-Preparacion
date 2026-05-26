# Bitácora de Cambios (CHANGELOG) - Actividad de Preparación EP2

Este archivo registra el historial de cambios y la evolución del código de infraestructura utilizando **Versionamiento Semántico (SemVer)**.

---

## [0.2.0] - 2026-05-26
### Adicionado
- Implementación de la etiqueta personalizada `Owner` en todos los recursos de los módulos de red y cómputo.
- Resolución de parámetros de red, incluyendo Internet Gateway, enrutamiento público y reglas HTTP/SSH en el Security Group.
- Inyección dinámica de variables (Subnet ID y Security Group ID) desde el orquestador raíz hacia el módulo EC2.

---

## [0.1.0] - 2026-05-20
### Adicionado
- Estructura base modularizada con las carpetas `vpc_module/` y `ec2_module/`.
- Archivo orquestador raíz `main.tf` con la invocación de módulos mediante rutas relativas.
- Plantilla de variables de entorno en `terraform.tfvars.example`.
- Instrucciones de autoevaluación e inicio de laboratorio en `README.md`.