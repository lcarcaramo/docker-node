FROM quay.io/ibmz/node:14.14.0

COPY . /home/node/app
WORKDIR /home/node/app

# EXPOSE 8888 (You would expose a port on a real node app)

RUN npm install

CMD [ "npm", "start" ]
