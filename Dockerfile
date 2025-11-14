# Dockerfile para servir documentación estática con Nginx
# Optimizado para MkDocs Material

FROM nginx:alpine

# Copiar archivos estáticos al directorio de Nginx
COPY . /usr/share/nginx/html

# Configuración personalizada de Nginx para docs
RUN echo 'server { \n\
    listen 80; \n\
    server_name _; \n\
    root /usr/share/nginx/html; \n\
    index index.html; \n\
    \n\
    # Habilitar compresión gzip \n\
    gzip on; \n\
    gzip_vary on; \n\
    gzip_min_length 1024; \n\
    gzip_types text/plain text/css text/xml text/javascript application/javascript application/xml+rss application/json; \n\
    \n\
    # Cache de recursos estáticos \n\
    location ~* \\.(?:css|js|jpg|jpeg|gif|png|ico|svg|woff|woff2|ttf|eot)$ { \n\
        expires 1y; \n\
        add_header Cache-Control \"public, immutable\"; \n\
    } \n\
    \n\
    # Manejar rutas para documentación \n\
    location / { \n\
        try_files $uri $uri/ =404; \n\
    } \n\
    \n\
    # Seguridad básica \n\
    add_header X-Frame-Options \"SAMEORIGIN\" always; \n\
    add_header X-Content-Type-Options \"nosniff\" always; \n\
    add_header X-XSS-Protection \"1; mode=block\" always; \n\
}' > /etc/nginx/conf.d/default.conf

# Exponer puerto 80
EXPOSE 80

# Iniciar Nginx
CMD [\"nginx\", \"-g\", \"daemon off;\"]
