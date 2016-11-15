#!/bin/sh -e

# This script will invoke your lambda with the body of JSON you provide

LAMBDA_NAME=$(cat $1 | jq -r '.lambdaName')

[[ -z $LAMBDA_NAME ]] && echo "Lambda name must be provided. Example ./awsInvoke.sh myLambda {\"type\": \"sweet\"}" && exit 1;
[[ -z "$2" ]] && echo "Lambda payload must be provided. Example ./awsInvoke.sh myLambda {\"type\": \"sweet\"}" && exit 1;

aws lambda invoke \
    --function-name $LAMBDA_NAME \
    --payload "$2" \
    output.txt

echo "Lambda output:"
cat output.txt
echo ""