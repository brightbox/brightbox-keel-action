#!/bin/sh -l

set -e

# Ensure variables set

[ -z "$image" ] && { echo 'No Image provided for keel notification' ; exit 1 ; }
[ -z "$tag" ] && { echo 'No image tag supplied' ; exit 1 ; }
[ -z "$hook_url" ] && { echo 'No keel hook url supplied' ; exit 1 ; }

# Support optional basic auth

if [ -z "$basic_auth_user" ] || [ -z "$basic_auth_password" ]; then
  auth_string=''
else
  auth_string="--user '${basic_auth_user}:${basic_auth_password}'"
fi

# Trigger the hook with curl

curl --request POST $auth_string --header "Content-Type: application/json" --data "{'name': '$image', 'tag': '$tag'}" $hook_url
