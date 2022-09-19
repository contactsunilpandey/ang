FROM nginx:stable-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY ${WD}/dist/ang /usr/share/nginx/html