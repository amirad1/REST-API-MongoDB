FROM node:latest

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package.json /usr/src/app

COPY app.js /usr/src/app

EXPOSE 4000

CMD [ "npm", "start" ]