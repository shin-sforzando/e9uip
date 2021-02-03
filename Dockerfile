FROM node:14-alpine

RUN apk --no-cache add --virtual=dev-tools git

WORKDIR /app

COPY package*.json ./

RUN npm install --no-optional && npm cache clean --force

ENV PATH /app/node_modules/.bin:$PATH

COPY . .

CMD ["nuxt-ts"]
