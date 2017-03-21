#!/bin/bash
#
# This script takes in a list of spaces (newline seperated) and deletes cf spaces in the
# Pivotal-Education-Students org.  Spaces are essentially e-mails.
#

if [ -z "$1" ]; then
  echo usage: $0 \<filename containing emails - 1 email per line\>
  exit
fi

filename=$1

org="Pivotal-Education-Students"
org_guid=$(cf org $org --guid)
echo "INFO: guid for $org is $org_guid"

for email in $(cat $filename) ; do

  space_guid=$(cf space $email --guid)
	echo "INFO: Deleting space: $email ($space_guid)"

  cf curl "/v2/spaces/$space_guid?recursive=true" -X DELETE

  # Remove the user from the organization
  cf curl "/v2/organizations/$org_guid/users" -X DELETE -d "{\"username\": \"$email\"}"

done
