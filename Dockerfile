# Step 1
# FROM node:10-alpine as build-step
FROM node as build-step
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm run build

# Stage 2
# FROM nginx:1.17.1-alpine
FROM nginx:stable-alpine
COPY --from=build-step /app/build /usr/share/nginx/html