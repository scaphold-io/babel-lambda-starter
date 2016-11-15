#!/bin/sh -e

./build.sh $1

LAMBDA_NAME=$(cat $1 | jq -r '.lambdaName')
LAMBDA_ROLE=$(cat $1 | jq -r '.lambdaRole')
LAMBDA_DESC=$(cat $1 | jq -r '.lambdaDescription')

[[ -z $LAMBDA_NAME ]] && echo "Lambda name must be provided. Example ./createLambda.sh myLambda \"arn:aws:iam::123456789:role/lambda_basic_execution\"" && exit 1;
[[ -z $LAMBDA_ROLE ]] && echo "IAM Role ARN must be provided. Example ./createLambda.sh myLambda \"arn:aws:iam::123456789:role/lambda_basic_execution\"" && exit 1;

aws lambda create-function \
    --function-name $LAMBDA_NAME \
    --runtime nodejs \
    --role $LAMBDA_ROLE \
    --handler bin/lambda.handler \
    --description $LAMBDA_DESC \
    --timeout 3 \
    --memory-size 128 \
    --zip-file fileb://$(pwd)/dist/lambda.zip