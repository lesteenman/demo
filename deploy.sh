#!/usr/bin/env bash
set -e

if [ -z "$BUCKET_NAME" ]; then
    echo "Missing environment variable: \$BUCKET_NAME"
    exit 1
fi

sam package \
    --s3-bucket=$BUCKET_NAME \
    --output-template-file .aws-sam/packaged.yaml

sam deploy \
    --stack-name=micronaut-api-gateway-demo \
    --template-file .aws-sam/packaged.yaml \
   --capabilities CAPABILITY_IAM \
