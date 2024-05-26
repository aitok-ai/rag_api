#!/bin/bash

# source ./test_variables.sh
ECS_CLUSTER_NAME=ec2-cluster
ECS_SERVICE_NAME=libreChat-rag-api-test-service
ECS_TASK_NAME=libreChat-rag-api-test

# Create a new version in the same family (if exists)
aws ecs register-task-definition --cli-input-json file://task_definition_test.json

# Force restart ECS service 
aws ecs update-service \
    --cluster $ECS_CLUSTER_NAME \
    --service $ECS_SERVICE_NAME \
    --task-definition $ECS_TASK_NAME \
    --force-new-deployment
