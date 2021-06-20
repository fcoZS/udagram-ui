## Build
FROM beevelop/ionic:latest AS ionic
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
COPY package*.json ./
RUN npm ci
# Bundle app source
COPY . .
# RUN ionic init
RUN ionic build
## Run
FROM nginx:alpine

COPY --from=ionic  /usr/src/app/www /usr/share/nginx/html

