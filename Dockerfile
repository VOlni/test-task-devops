# Stage 1: Build the application
FROM node:latest as builder

WORKDIR /usr/src/app

COPY ./nest-js-app/package*.json ./

RUN npm install

COPY ./nest-js-app .

RUN npm run build

# Stage 2: Setup the production environment
FROM node:alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist ./dist
COPY --from=builder /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD [ "node", "dist/main"]
