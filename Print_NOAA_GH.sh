#!/bin/bash
gh_search=$(curl -s "https://api.github.com/search/users?q=NOAA-")
TOTAL=$(echo "$gh_search" | grep total | awk '{ print $2 }' | sed 's/,*$//g')
USERS=$(echo "$gh_search" | grep login | awk '{ print $2 }' | sort | tr -d '"' | sed 's/,*$//g')

echo "There are $TOTAL NOAA github Orgs:"
#search for NOAA- users
#echo "$USERS"
#return repo names for an org, to be specified later
for i in $USERS 
do
    echo "$i"
    curl -s https://api.github.com/orgs/$i/repos | grep full_name | awk '{ print $2 }' | sed 's/,*$//g'
done
#curl https://api.github.com/orgs/noaa-owp/repos | grep full_name | awk '{ print $2 }'
#curl https://api.github.com/orgs/noaa-edab/repos | grep full_name | awk '{ print $2 }'
exit
