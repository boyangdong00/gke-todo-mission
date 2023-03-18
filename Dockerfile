ARG NODE_VERSION=19
FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/src/app

# Copy package.json and install node modules
COPY src/package.json /usr/src/app
RUN npm install

# Add app source code
ADD /src /usr/src/app

EXPOSE 8080

ENTRYPOINT npm run start