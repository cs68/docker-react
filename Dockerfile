FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set proxy http://PlouseF:Uloserno888@10.14.160.53:3128
RUN npm config set https-proxy http://PlouseF:Uloserno888@10.14.160.53:3128
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
