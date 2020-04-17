FROM node:12-alpine

ARG NPM_TOKEN
ENV NPM_TOKEN=$NPM_TOKEN

ARG ENGINE_API_KEY
ENV ENGINE_API_KEY=$ENGINE_API_KEY

# set environment
RUN set -e

# Create app directory
RUN mkdir -p /usr/src/action
WORKDIR /usr/src/action

# Bundle app source
COPY . /usr/src/action

RUN npx apollo service:check --serviceName=search-service --tag=development