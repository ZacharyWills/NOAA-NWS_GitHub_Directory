#!/bin/bash
gh_search=$(curl -s "https://api.github.com/search/users?q=NOAA-&per_page=200")
TOTAL=$(echo "$gh_search" | grep total | awk '{ print $2 }' | sed 's/,*$//g')
USERS=$(echo "$gh_search" | grep login | awk '{ print $2 }' | sort | tr -d '"' | sed 's/,*$//g')

echo "There are $TOTAL NOAA github Orgs:"
#search for NOAA- users
#echo "$USERS"
#return repo names for an org, to be specified later
for i in $USERS 
do
    echo "$i"
    curl -s https://api.github.com/orgs/$i/repos?per_page=200 | grep full_name | awk '{ print $2 }' | sort | tr -d '"' | sed 's/,*$//g'
    #jq --raw-output .[].full_name will avoid the bash mess if you have jq
done
#curl https://api.github.com/orgs/noaa-owp/repos?per_page=200 | grep full_name | awk '{ print $2 }'
#curl https://api.github.com/orgs/noaa-edab/repos | grep full_name | awk '{ print $2 }'
#curl https://www.fire.ca.gov/ubraco/Api/IncidentApi/GetIncidents | jq --raw-output '.Incidents | .[].Name'
exit
