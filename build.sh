#!/bin/sh -e

# install dependencies, run unit tests, and bundle all the files into a deployable zip file.
if [ ! -f $1 ]; then
    echo "Unable to build Lambda.zip! You must point to a valid \"config.json\"!"
    exit 1
fi

npm install

rm -rf ./dist
mkdir -p dist

npm test

zip -r -q dist/lambda.zip ./ -x ./*\.sh ./.git/**\* ./dist ./spec ./provisioning ./.idea ./src
