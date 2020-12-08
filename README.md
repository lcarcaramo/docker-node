## Tags
> _Built from [`quay.io/ibm/alpine:3.12`](https://quay.io/repository/ibm/alpine?tab=info)_
-	`14.14.0` - [![Build Status](https://travis-ci.com/lcarcaramo/docker-node.svg?branch=master)](https://travis-ci.com/lcarcaramo/docker-node)

### __[Original Source Code](https://github.com/nodejs/docker-node)__

## Node.js

Node.js is a platform built on Chrome's JavaScript runtime for easily building
fast, scalable network applications. Node.js uses an event-driven, non-blocking
I/O model that makes it lightweight and efficient, perfect for data-intensive
real-time applications that run across distributed devices.

See: http://nodejs.org

## How to use this image

### Create a `Dockerfile` in your Node.js app project

```dockerfile
FROM quay.io/ibm/node:14.14.0

COPY . /home/node/app
WORKDIR /home/node/app

RUN npm install

EXPOSE # Put the port that your app listens on here.

CMD [ "npm", "start" ]

```

You can then build and run the Docker image:

```console
$ docker build -t my-nodejs-app .
$ docker run -it --rm --name my-running-app my-nodejs-app
```

### Verbosity

Prior to 8.7.0 and 6.11.4 the docker images overrode the default npm log
level from `warn` to `info`. However due to improvements to npm and new Docker
patterns (e.g. multi-stage builds) the working group reached a [consensus](https://github.com/nodejs/docker-node/issues/528)
to revert the log level to npm defaults. If you need more verbose output, please
use one of the following methods to change the verbosity level.

#### Dockerfile

If you create your own `Dockerfile` which inherits from the `node` image you can
simply use `ENV` to override `NPM_CONFIG_LOGLEVEL`.

```dockerfile
FROM quay.io/ibm/node:14.14.0
ENV NPM_CONFIG_LOGLEVEL info
...
```

#### Docker Run

If you run the node image using `docker run` you can use the `-e` flag to
override `NPM_CONFIG_LOGLEVEL`.

```console
$ docker run -e NPM_CONFIG_LOGLEVEL=info quay.io/ibm/node:14.14.0 ...
```

#### NPM run

If you are running npm commands you can use `--loglevel` to control the
verbosity of the output.

```console
$ docker run quay.io/ibm/node:14.14.0 npm --loglevel=warn ...
```

## License

[License information](https://github.com/nodejs/node/blob/master/LICENSE) for
the software contained in this image. [License
information](https://github.com/nodejs/docker-node/blob/master/LICENSE) for the
Node.js Docker project.
