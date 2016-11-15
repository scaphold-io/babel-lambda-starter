#!/bin/sh -e

# Build and upload the latest version of your code to AWS

LAMBDA_NAME=$(cat $1 | jq -r '.lambdaName')

[[ -z $LAMBDA_NAME ]] && echo "Lambda name must be provided. Example ./awsUpdate.sh myLambda" && exit 1;

./build.sh

aws lambda update-function-code \
  --function-name $LAMBDA_NAME \
  --zip-file fileb://$(pwd)/dist/lambda.zip