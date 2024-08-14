# ---- Dependencies ----
# 使用多架构的基础镜像
FROM --platform=linux/amd64 sub-web:latest AS amd64-sub-web
FROM --platform=linux/arm64 sub-web:latest AS arm64-sub-web

FROM node:16-alpine AS build
WORKDIR /app
COPY . .
RUN yarn install
RUN yarn build

# 构建多架构的镜像
FROM amd64-sub-web AS amd64-nginx
FROM nginx:1.24-alpine AS amd64-nginx-base
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]

FROM arm64-sub-web AS arm64-nginx
FROM nginx:1.24-alpine AS arm64-nginx-base
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
