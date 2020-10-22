#!/bin/bash

set -e

export ANSI_YELLOW="\e[1;33m"
export ANSI_GREEN="\e[32m"
export ANSI_RESET="\e[0m"

echo -e "\n $ANSI_YELLOW *** FUNCTIONAL TEST(S) *** $ANSI_RESET \n"

echo -e "$ANSI_YELLOW It can run a Node.js app: $ANSI_RESET"
docker build -t test/run-app/quay.io/ibmz/node runs-node-apps
docker run --rm --name runs-node-apps --user node test/run-app/quay.io/ibmz/node
docker rmi test/run-app/quay.io/ibmz/node

echo -e "\n $ANSI_GREEN *** FUNCTIONAL TEST(S) COMPLETED SUCESSFULLY *** $ANSI_RESET \n"
