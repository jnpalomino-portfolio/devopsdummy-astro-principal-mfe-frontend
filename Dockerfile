FROM node:20.17.0-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine

RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx /tmp && \
    chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /tmp

COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY nginx-main.conf /etc/nginx/nginx.conf

RUN chmod -R 777 /usr/share/nginx/html && \
    chmod -R 777 /etc/nginx/conf.d && \
    touch /var/run/nginx.pid && \
    chmod -R 777 /var/run/nginx.pid

# Configurar usuario no-root
USER nginx

EXPOSE 8007
CMD ["nginx", "-g", "daemon off;"]