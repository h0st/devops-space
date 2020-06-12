#!/bin/bash

# https://docs.aws.amazon.com/vm-import/latest/userguide/vmimport-image-import.html

aws ec2 import-image --description "My server VM" --disk-containers "file://containers.json"

IMPORT_AMI_TASK_ID=""

aws ec2 describe-import-image-tasks --import-task-ids $IMPORT_AMI_TASK_ID