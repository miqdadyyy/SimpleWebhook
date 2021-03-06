FROM node:12.0-alpine

RUN apk update && apk upgrade && apk add --no-cache bash git openssh

USER node

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package.* ./

RUN npm install

COPY . .

ENV HANDLER_PATH /webhook

ENV HANDLER_SECRET secret

ENV GIT_USERNAME git_username

ENV GIT_TOKEN git_token

ENV GIT_SOURCE github.com

ENV GIT_REPOSITORY_REF refs/heads/master

ENV GIT_REPOSITORY_REMOTE origin

ENV GIT_REPOSITORY_BRANCH master

EXPOSE 7777

CMD node index.js
