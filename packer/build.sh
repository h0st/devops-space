#!/bin/bash

TEMPLATE="${1}"

packer --version

packer build $TEMPLATE
