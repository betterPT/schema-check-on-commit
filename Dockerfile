# Container image that runs your code
FROM node:12-alpine

ARG ENGINE_API_KEY
ENV ENGINE_API_KEY=$ENGINE_API_KEY

# set environment
RUN set -e

# Create app directory
RUN mkdir -p /usr/src/action
WORKDIR /usr/src/action/

COPY . /usr/src/action

# Install app dependencies


RUN npx apollo service:check --serviceName=search-service --tag=development