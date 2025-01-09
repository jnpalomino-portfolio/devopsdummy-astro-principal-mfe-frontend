FROM node:20.17.0-alpine AS builder
WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build


FROM node:20.17.0-alpine
WORKDIR /app
RUN npm install -g astro
COPY --from=builder /app/dist /app/dist
EXPOSE 8007
CMD ["astro", "preview", "--port", "8007", "--host"]