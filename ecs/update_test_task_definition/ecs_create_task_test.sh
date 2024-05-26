#!/bin/bash

# source ./test_variables.sh

# Create a new version in the same family (if exists)
aws ecs register-task-definition --cli-input-json file://task_definition_test.json
