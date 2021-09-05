#!/bin/bash
#
# Setup how git hooks to a central place

function help {
    echo "This script aims at configuring git hooks for you!"
    echo "Usage: install.sh [-p | --path <path>]"
}

# Handle script arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--path) config_path="$2"; shift ;;
        -h|--help) help; exit 0 ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Default to path of the installation script if no path for config is specified
if [[ -z $config_path ]]; then
    config_path=$orig_path
fi

# Evaluate the absolute path of the installation script
# Here are all of the files to be found if we would copy them later on
orig_path=$(readlink -e $(dirname $0))

# Setup git hooks directory
config_path=$(readlink -e $config_path)
echo "Going into: $config_path"
cd $config_path

if [[ "$orig_path" != "$config_path" ]]; then
    echo "Copying files to target directory: $config_path"
    orig_path="$orig_path/*"
    cp $orig_path "$config_path"
fi

# Fix git hooks variable yaml file and helper functions
pwd=$(pwd) # this makes sense because we `cd`ed already in a previous step to the right dir
dir="${pwd////\\/}" # replace all `/` characters with `\/` in order to escape slashes for sed... UNIX!
echo "Updating git hook variable configs for pre-push"
sed -i 's/\(source \).*/\1'"$dir"'\/git-hook-helper.sh/' pre-push
sed -i 's/\(create_variables \).*/\1'"$dir"'\/git-hook-variables.yaml/' pre-push
echo "Updating git hook variable configs for pre-commit "
sed -i 's/\(source \).*/\1'"$dir"'\/git-hook-helper.sh/' pre-commit
sed -i 's/\(create_variables \).*/\1'"$dir"'\/git-hook-variables.yaml/' pre-commit
echo "Updating git hook variable configs for prepare-commit-msg "
sed -i 's/\(source \).*/\1'"$dir"'\/git-hook-helper.sh/' prepare-commit-msg
sed -i 's/\(create_variables \).*/\1'"$dir"'\/git-hook-variables.yaml/' prepare-commit-msg

# Configure user .gitconfig, which is found in $HOME
# The "hooksPath" setting is part of the "[core]" section
# Thus we don't want to override that section if there is something in it
if ! grep "hooksPath" $HOME/.gitconfig &>/dev/null ; then
    echo "Updating user $HOME/.gitconfig to have 'hooksPath' variable"
    if grep "[core]" $HOME/.gitconfig &>/dev/null ; then
        echo -e "[core]\n\thooksPath = $(pwd)" >> $HOME/.gitconfig
    else
        sed -i '/\[core\]/a \\thooksPath = '"$dir" $HOME/.gitconfig
    fi
fi
