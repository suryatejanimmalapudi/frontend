FROM node:latest as node
WORKDIR /src/app
COPY . .
RUN npm install
RUN npm run build --prod
#stage 2
FROM nginx:alpine
COPY --from=node /app/dist/angular-ecommerce /usr/share/nginx/html