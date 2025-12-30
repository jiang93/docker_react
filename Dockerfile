# base image 
FROM node:20-alpine AS builder

# copy & install dependencies
WORKDIR '/frontend'
COPY package.json .
RUN npm install

# copy all file
COPY . .
RUN npm run build 

FROM nginx
COPY --from=builder /frontend/build /usr/share/nginx/html