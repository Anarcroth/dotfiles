#!/bin/bash
#
# Update local repositories in a directory

if [[ $# -eq 0 ]]; then
  echo "No directory supplied" >&2
else
  for d in $(find $1 -maxdepth 2 -type d -name .git); do
    cd $d; cd ..
    if [[ -z "$(git status --porcelain)" ]]; then
      echo -E "Pull changes from master to local repo: $(pwd)"
      git fetch origin master:master --update-head-ok
    else
      echo -E "Local changes found, not pulling anything: $(pwd)"
    fi
  done
fi
