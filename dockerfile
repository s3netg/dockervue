FROM node:12.16.1-alpine As build

RUN mkdir /app

WORKDIR /app

COPY package.json /app

RUN npm install

COPY . /app

RUN npm run build


# Stage 2

FROM nginx:1.15.8-alpine

COPY --from=build /app/dist /usr/share/nginx/html