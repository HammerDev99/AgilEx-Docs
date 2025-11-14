# AgilEx by Marduk - Documentación

Documentación estática generada con MkDocs Material.

**URL de producción**: https://docs.agilex.sprintjudicial.com

## 🔄 Actualización Automática

Esta documentación se genera automáticamente desde el proyecto principal:
- Repositorio fuente: [GestionExpedienteElectronico_Version1](https://github.com/HammerDev99/GestionExpedienteElectronico_Version1)
- Generador: MkDocs Material
- Deploy: Easypanel con webhook de GitHub

## 📝 Para actualizar

En el proyecto principal (desde la carpeta docs/):
```powershell
# Construir y sincronizar
.\sync-docs.ps1

# Hacer commit manualmente en deploy-docs/
cd deploy-docs
git add .
git commit -m "Actualiza documentación"
git push origin main
```

---
*Última actualización: 2025-11-14 10:07:09*
