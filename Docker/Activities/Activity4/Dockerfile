# Specify Base Image
FROM docker.io/node:18-alpine

# Work Directory
WORKDIR /usr/app

#copy the package.json
COPY package.json ./

#install the required tools
RUN npm install

#copy the other files in to the container
COPY ./ ./

# Startup Command
CMD ["npm", "start"]