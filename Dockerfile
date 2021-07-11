FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#for production work flows
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html