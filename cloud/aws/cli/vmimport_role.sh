#!/bin/bash

# https://documentation.commvault.com/commvault/v11/article?p=108828.htm
# https://github.com/rubrikinc/ansible-role-aws-vmimport-role

aws iam create-role --role-name vmimport --assume-role-policy-document file://files/trust-policy.json   # provide access key / secret

aws iam put-role-policy --role-name vmimport --policy-name vmimport --policy-document file://files/role-policy.json