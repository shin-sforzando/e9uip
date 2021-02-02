FROM node:14-alpine

RUN apk update && apk upgrade

WORKDIR /app

COPY --chown=node:node package*.json ./

RUN npm install

COPY --chown=node:node . .

USER node

CMD ["npm", "run", "dev"]
