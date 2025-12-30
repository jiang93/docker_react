# base image 
FROM node:20-alpine AS builder

# copy & install dependencies
WORKDIR '/docker_react'
COPY package.json .
RUN npm install

# copy all file
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /docker_react/build /usr/share/nginx/html