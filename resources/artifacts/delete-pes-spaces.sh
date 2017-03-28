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

user=$(cf target |grep User |cut -c 17-)

for email in $(cat $filename) ; do

  # This is necessary in case the user running the script does not have
  # SpaceDeveloper role to each of the spaces that are to be cleaned up.
  echo "INFO: Assigning $user SpaceDeveloper role for space $email"
  cf set-space-role $user $org $email SpaceDeveloper

  # Attempt to delete the service instance for the MongoDB service broker.
  # Note we are making an assumption on the service name here, if the student
  # used any other name this will obviously fail.
  echo "INFO: Attempting to force deletion of the mongo-service service instance"
  cf purge-service-instance mongo-service -f
  
  # Delete the space
  space_guid=$(cf space $email --guid)
	echo "INFO: Deleting space: $email ($space_guid)"
  cf curl "/v2/spaces/$space_guid?recursive=true" -X DELETE

  # Remove the user from the organization
  echo "INFO: Removing $email user from $org"
  cf curl "/v2/organizations/$org_guid/users" -X DELETE -d "{\"username\": \"$email\"}"

done
