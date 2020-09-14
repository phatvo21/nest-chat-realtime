FROM node:10-alpine

# Install PM2
RUN npm install -g pm2

RUN mkdir -p /var/www/in-game-item-api
WORKDIR /var/www/in-game-item-api

ENV PATH /var/www/in-game-item-api/node_modules/.bin:$PATH
RUN adduser --disabled-password gameskill

# Copy existing application directory contents
COPY . /var/www/in-game-item-api
COPY package.json /var/www/in-game-item-api/package.json
COPY package-lock.json /var/www/in-game-item-api/package-lock.json

RUN chown -R gameskill:gameskill /var/www/in-game-item-api
USER gameskill

RUN npm cache clean --force
RUN npm install

EXPOSE 3009
#CMD [ "npm", "run", "pm2-delete" ]
#CMD [ "npm", "run", "build-docker-dev" ]
CMD [ "npm", "run", "start:dev" ]
