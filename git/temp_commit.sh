#!/bin/bash

function help {
    echo -e "\nThis script will save your local changes to a temporary branch.\nUseful in cases where you are working on many changes and you don't know which will stick and which will go,\nbut you still need to save your work and push it to remote before committing to anything specific.\n"
    echo "usage: git temp-commit [-m|--message <commit message>] [-b|--branch <temp branch name>] [-p|--push]"
}

# Handle script arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -m|--message) message="$2"; shift ;;
        -b|--branch) tmp_branch="$2"; shift ;;
        -p|--push) to_push=1; shift ;;
        -c|--clean-slate) clean_slate=1; shift ;;
        -h) help; exit 1 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

if [[ -z $tmp_branch ]]; then
    echo -e "\nYou have not specified a temporary branch!\nAborting!"; exit 1;
fi

# Prepend temp/ before the name branch, just to follow nomenclature
if [[ $tmp_branch != temp/* ]]; then
    tmp_branch="temp/"${tmp_branch}
fi
# If the specified branch doesn't exist create it, otherwise add the changes to the temporary branch
if [[ -z $(git branch --list $tmp_branch) ]]; then
    echo "Creating temporary branch '$tmp_branch'"
    git branch $tmp_branch
else
    echo "'$tmp_branch' already exists!"
fi

# Commit code changes
echo "Committing changes for temporary storage"
git add .
curr_branch=$(git rev-parse --abbrev-ref HEAD)
if [[ -z $message ]]; then
    echo "Creating a default commit message"
    message="Temporary commit #$(git rev-list $curr_branch..$tmp_branch --count)"
fi
# This breaks if you are committing in the middle of a branch. Should always execute on the top of a branch
git commit --no-verify -m "$message"
# Go to the temp branch and directly apply the commit we just did
git checkout $tmp_branch
git cherry-pick --allow-empty --keep-redundant-commits --strategy-option=theirs $curr_branch
# Check if there is a difference between the two branches. We DON'T want any difference!
if [[ ! -z $(git diff $tmp_branch $curr_branch &>/dev/null) ]]; then
    echo "!!Warning!!"
    echo "There are still some differences between your changes and the applied ones to the temporary branch!"
    echo "Please inspect them before continuing further!!"
    exit 1
fi

if [[ $to_push ]]; then
    echo "Pushing temporary changes to remote"
    # This makes the assumption that origin is the remote. It COULD be something else...
    git push origin $tmp_branch
fi

# Go back to the original place HEAD was
git switch -

if [[ $clean_slate ]]; then
    git reset --hard HEAD^
else
    # Reset the commit we just did
    # We want to do this so that we can be an the exact same state we were before doing this whole process
    git reset --soft HEAD^
    git restore --staged .
fi
