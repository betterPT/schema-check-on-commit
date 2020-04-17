FROM node:12-alpine

ARG NPM_TOKEN
ENV NPM_TOKEN=$NPM_TOKEN

ARG ENGINE_API_KEY
ENV ENGINE_API_KEY=$ENGINE_API_KEY

# set environment
RUN set -e

# Create app directory
RUN mkdir -p /usr/src/app/
WORKDIR /usr/src/app/

# Install app dependencies
COPY package.json /usr/src/app/

RUN echo "//registry.npmjs.org/:_authToken=${NPM_TOKEN}" > .npmrc
RUN yarn install --production
RUN rm -f .npmrc

# Bundle app source
COPY . /usr/src/app/

RUN npx apollo service:check --serviceName=search-service --tag=development