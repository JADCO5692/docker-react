FROM node:alpine as builder
WORKDIR '/usr/react1'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /usr/react1/build /usr/share/nginx/html
