# Use a simple web server image
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
