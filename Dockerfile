FROM node:18.9-alpine3.15 

RUN apk update && apk add chromium
