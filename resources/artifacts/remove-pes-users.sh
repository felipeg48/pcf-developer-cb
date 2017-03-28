#!/bin/bash
#
# This script will remove all non-pivotal users the Pivotal-Education-Students org.
# BE CAREFUL!!
#

read -r -p "Are you sure you want to delete all non-Pivotal users from the Pivotal-Education-Students org? [y/N] " response
case "$response" in
    [yY][eE][sS]|[yY])
        org="Pivotal-Education-Students"
        org_guid=$(cf org $org --guid)
        echo "INFO: guid for $org is $org_guid"

        for user in $(cf curl /v2/organizations/$org_guid/users |grep username |cut -d':' -f2 |grep -v "pivotal" | sed -e 's/ \"//g' -e 's/\",//g' |sort
        ) ; do

          echo "INFO: Removing $user from $org"
          cf curl "/v2/organizations/$org_guid/users" -X DELETE -d "{\"username\": \"$user\"}"

        done
        ;;
    *)
        echo "INFO: Aborted."
        ;;
esac
