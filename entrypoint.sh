#!/bin/sh -l

set -e

# Ensure variables set

# Read env from environment

[ -z "$INPUT_IMAGE" ] && { echo 'No image provided for Keel notification' ; exit 1 ; }
[ -z "$INPUT_TAG" ] && { echo 'No image tag supplied' ; exit 1 ; }
[ -z "$INPUT_HOOK_URL" ] && { echo 'No Keel hook url supplied' ; exit 1 ; }

# Support optional basic auth

if [ -z "$INPUT_BASIC_AUTH_USER" ] || [ -z "$INPUT_BASIC_AUTH_PASSWORD" ]; then
  auth_string=''
else
  auth_string="--user '${INPUT_BASIC_AUTH_USER}:${INPUT_BASIC_AUTH_PASSWORD}'"
fi

# Trigger the hook with curl

curl --request POST $auth_string --header "Content-Type: application/json" --data "{'name': '$INPUT_IMAGE', 'tag': '$INPUT_TAG'}" $INPUT_HOOK_URL
