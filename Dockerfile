FROM node:14-alpine

RUN apk --no-cache add --virtual=dev-tools git make yarn

WORKDIR /app
RUN chmod g+w /app

COPY package*.json ./

RUN yarn install --ignore-optional

ENV PATH /app/node_modules/.bin:$PATH

COPY . .

CMD ["nuxt-ts"]
