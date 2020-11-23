#!/bin/bash

# Handle script arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -m|--message) message="$2"; shift ;;
        -b|--branch) brach="$2"; shift ;;
        -p|--push) to_push="$2"; shift ;;
        -h|--help) help; exit 1 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# If the specified branch doesn't exist create it, otherwise rebase it to the current HEAD
if [[ -z $(git branch --list $branch) ]]; then
    $branch="temp/"$branch
    git checkout -b $branch
else
    git rebase $branch
    git checkout $branch
fi

# Commit code changes
git add .
git commit -m $message

if [[ $to_push ]]; then
    git push origin $branch
fi

# Go back to the original place HEAD was
git switch -

git cherry-pick --no-commit $branch
git restore --staged .
