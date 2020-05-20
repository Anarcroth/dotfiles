#!/bin/bash

if [ -z "$1" ]
then
    echo "No SHA1 supplied for date change!"
    exit
fi

echo "What is the new date?"
read $NEW_COMMITTER_DATE

git filter-branch -f --env-filter \
    'if [ $GIT_COMMIT = '$1' ]
    then
	export GIT_AUTHOR_DATE='$NEW_COMMITTER_DATE'
	export GIT_COMMITTER_DATE='$NEW_COMMITTER_DATE'
    fi'
