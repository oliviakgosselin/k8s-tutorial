# stage 1
FROM node:alpine AS k8s-tutorial-build

WORKDIR /app

COPY . .

RUN npm ci && npm run build

EXPOSE 80

#stage 2

FROM nginx:alpine
COPY --from=k8s-tutorial-build /app/dist/k8s-tutorial /usr/share/nginx/html
EXPOSE 8080