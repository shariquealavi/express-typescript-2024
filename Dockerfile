FROM node:current-slim

# Create app directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install
RUN npm ci

# Bundle app source
COPY . .

# Build the TypeScript files
RUN npm run build

# Expose port 8888
EXPOSE 8888

# Start the app
CMD npm run start
