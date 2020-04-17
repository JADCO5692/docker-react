FROM node:alpine
WORKDIR '/usr/react1'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=0 /usr/react1/build /usr/share/nginx/html
