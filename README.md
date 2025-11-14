# AgilEx by Marduk - Documentación Oficial

[![Deploy Status](https://img.shields.io/badge/deploy-easypanel-blue)](https://docs.agilex.sprintjudicial.com)
[![MkDocs](https://img.shields.io/badge/docs-mkdocs--material-blue)](https://squidfunk.github.io/mkdocs-material/)
[![Nginx](https://img.shields.io/badge/server-nginx--alpine-green)](https://nginx.org/)

Documentación estática generada automáticamente con **MkDocs Material**.

## 🌐 URL de Producción

**https://docs.agilex.sprintjudicial.com**

## 📁 Estructura

Este repositorio contiene únicamente los archivos estáticos compilados de la documentación:

- `index.html` - Página principal
- `assets/` - Recursos estáticos (CSS, JS, imágenes)
- `search/` - Índice de búsqueda
- Páginas de documentación en HTML

## 🔄 Actualización Automática

Esta documentación se genera automáticamente desde el proyecto principal:

- **Repositorio fuente**: [GestionExpedienteElectronico_Version1](https://github.com/HammerDev99/GestionExpedienteElectronico_Version1)
- **Generador**: MkDocs Material
- **Deploy**: Easypanel con auto-deploy desde GitHub
- **Stack**: Nginx Alpine + Dockerfile optimizado

## 📝 Flujo de Actualización

### 1. Generar documentación (en el proyecto principal)

```powershell
# Desde la carpeta docs/
cd docs
.\sync-docs.ps1
```

### 2. Commit y push

```bash
cd deploy-docs
git add .
git commit -m "docs: actualiza documentación v1.5.0"
git push origin main
```

### 3. Deploy automático

Easypanel detecta el push y despliega automáticamente vía webhook de GitHub.

## 🐳 Docker

El despliegue utiliza un contenedor Nginx Alpine optimizado:

- **Imagen base**: `nginx:alpine`
- **Puerto**: 80
- **Compresión**: gzip mejorado (nivel 6, tipos MIME extendidos)
- **Cache**: Headers optimizados diferenciados (estáticos: 1 año, HTML: sin cache)
- **Seguridad**: Headers HTTP de seguridad configurados
- **Healthcheck**: Verificación automática cada 30s
- **Charset**: UTF-8

## 🔒 Seguridad

- Headers de seguridad HTTP completos
- Sin exposición de versión de Nginx (server_tokens off)
- Permissions-Policy restrictivo
- X-Frame-Options, X-Content-Type-Options, X-XSS-Protection
- Referrer-Policy configurado

## 📊 Información del Build

- **Última actualización**: 2025-11-14 10:26:34
- **Generado por**: sync-docs.ps1 v2.0

---

**Nota**: Este repositorio es generado automáticamente. No edites archivos directamente aquí.
Todos los cambios deben hacerse en el [repositorio fuente](https://github.com/HammerDev99/GestionExpedienteElectronico_Version1).