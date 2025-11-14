# Dockerfile para servir documentación estática con Nginx
# Optimizado para MkDocs Material y mejores prácticas de seguridad

FROM nginx:alpine

# Etiquetas de metadata
LABEL maintainer="HammerDev99" \
      description="Documentación estática de AgilEx con Nginx" \
      version="1.0"

# Copiar archivos estáticos al directorio de Nginx
COPY . /usr/share/nginx/html

# Configuración optimizada de Nginx
RUN echo 'server { \
    listen 80; \
    server_name _; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    # Configuración de charset \
    charset utf-8; \
    \
    # Habilitar compresión gzip \
    gzip on; \
    gzip_vary on; \
    gzip_proxied any; \
    gzip_comp_level 6; \
    gzip_min_length 1024; \
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json application/x-javascript application/xml image/svg+xml; \
    \
    # Cache de recursos estáticos (1 año) \
    location ~* \.(?:css|js|jpg|jpeg|gif|png|ico|cur|gz|svg|svgz|mp4|ogg|ogv|webm|htc|woff|woff2|ttf|eot|webp)$ { \
        expires 1y; \
        add_header Cache-Control "public, immutable"; \
        access_log off; \
    } \
    \
    # Cache para HTML (sin cache para actualizaciones inmediatas) \
    location ~* \.(?:html)$ { \
        expires -1; \
        add_header Cache-Control "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0"; \
    } \
    \
    # Manejar rutas para documentación \
    location / { \
        try_files $uri $uri/ $uri/index.html =404; \
    } \
    \
    # Headers de seguridad \
    add_header X-Frame-Options "SAMEORIGIN" always; \
    add_header X-Content-Type-Options "nosniff" always; \
    add_header X-XSS-Protection "1; mode=block" always; \
    add_header Referrer-Policy "strict-origin-when-cross-origin" always; \
    add_header Permissions-Policy "geolocation=(), microphone=(), camera=()" always; \
    \
    # Ocultar versión de Nginx \
    server_tokens off; \
    \
    # Logging personalizado \
    access_log /var/log/nginx/access.log; \
    error_log /var/log/nginx/error.log warn; \
}' > /etc/nginx/conf.d/default.conf

# Exponer puerto 80
EXPOSE 80

# Healthcheck para validar que Nginx está respondiendo
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD wget --quiet --tries=1 --spider http://localhost/ || exit 1