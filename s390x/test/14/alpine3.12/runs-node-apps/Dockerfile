FROM quay.io/ibmz/node:14.14.0

COPY . /home/node/app
WORKDIR /home/node/app

RUN npm install

CMD [ "node", "app.js" ]
