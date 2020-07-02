FROM node:10-alpine

# By default, the Docker Node image includes a non-root node user that you can use to avoid running your application container as root. 
# use node user home DIR 
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

# ensure all app files are owned by non-root node user
USER node

RUN npm install

# copy app code
COPY --chown=node:node . .

EXPOSE 8080

CMD [ "node", "app.js" ]