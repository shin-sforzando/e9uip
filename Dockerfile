FROM node:14-alpine

RUN apk --no-cache add --virtual=dev-tools git make yarn

WORKDIR /app
RUN chmod g+w /app

COPY package*.json ./
COPY .yarnclean ./

RUN yarn install --ignore-optional && \
    yarn autoclean --force

ENV PATH /app/node_modules/.bin:$PATH

COPY . .

CMD ["nuxt-ts"]
