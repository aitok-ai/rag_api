#!/bin/bash

export AWS_DEFAULT_REGION=ap-southeast-1

ECS_CLUSTER_NAME=production
ECS_SERVICE_NAME=libreChat-rag-api-prod-service
ECS_TASK_NAME=libreChat-rag-api-prod

# Create a new version in the same family (if exists)
aws ecs register-task-definition --cli-input-json file://task_definition_prod.json

# Force restart ECS service 
aws ecs update-service \
    --cluster $ECS_CLUSTER_NAME \
    --service $ECS_SERVICE_NAME \
    --task-definition $ECS_TASK_NAME \
    --force-new-deployment
