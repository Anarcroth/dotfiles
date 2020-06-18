#!/bin/bash
#
# Delete branches that are already merged into either
# 'master', 'develop', 'dev', or 'release'

function delete_all_branches {
    git branch -d $branches_to_delete
}

function delete_some_branches {
    for br in "${array[@]}"
    do
	echo "Delete '$br'?"
	read answer
	if [[ $answer == "Y" ]]
	then
	    git branch -d $br
	fi
    done
}

branches_to_delete=$(git branch --merged | grep -Ev "(^\*|master|develop|dev|release)" | tr -d "\n")

if [[ -z $branches_to_delete ]]
then
    echo "No branches to delete"
    exit
fi

# Split branches into array
IFS=' ' read -r -a array <<< "$branches_to_delete"

# Output all branches for deletion
echo "The following branches will be deleted."
for br in "${array[@]}"
do
    echo $br
done

echo "Do you want to delete these branches? ([A]ll/[S]ome/[N]one)"
read answer

case "$answer" in
    "a" | "A")
	delete_all_branches
	;;
    "s" | "S")
	delete_some_branches
	;;
    "n" | "N")
	echo "Doing nothing"
	;;
    *)
	echo "Quitting"
	;;
esac
