ARG NODE_VERSION=19
FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/src/app

# Copy package.json and install node modules
COPY src/package.json .
RUN npm install

# Add app source code
ADD . /usr/src/app

ENTRYPOINT npm run start