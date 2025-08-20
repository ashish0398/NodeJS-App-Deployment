# Stage:1 Build the application
FROM node:24-alpine AS build    
WORKDIR /opt/NodeJS-App-Deployment/app
COPY package*.json ./
RUN npm cache clean --force && npm install
COPY . .

# Stage:2 Serve the application
FROM node:24-alpine
WORKDIR /opt/NodeJS-App-Deployment/app
COPY --from=build /app .
USER node
EXPOSE 3000
CMD [ "node", "app.js" ]