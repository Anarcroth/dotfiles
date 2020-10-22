#!/bin/bash
#
# Setup how git hooks to a central place

while [[ "$#" -gt 0 ]]; do
    case $1 in
        -p|--path) config_path="$2"; shift ;;
        -n|--name) config_dir_name="$2"; shift ;;
        *) echo "Unknown parameter passed: $1"; exit 1 ;;
    esac
    shift
done

# Default to path of the installation script if no path for config is specified
if [[ -z $config_path ]]; then
    config_path=$(dirname $0)
fi
# Default to "git" if no name for config dir is specified
if [[ -z $config_dir_name ]]; then
    config_dir_name="git"
fi

# Setup git hooks directory
echo "Going into $config_path"
cd $config_path

#echo "Creating directory $config_dir_name"
#mkdir -p -v $config_dir_name

# Fix git hooks variable yaml file and helper functions
pwd=$(pwd) # this makes sense because we `cd`ed already in a previous step to the right dir
dir="${pwd////\\/}"
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
    echo "here"
    if grep "[core]" $HOME/.gitconfig &>/dev/null ; then
        echo -e "[core]\n\thooksPath = $(pwd)" >> $HOME/.gitconfig
    else
        sed -i '/\[core\]/a \\thooksPath = '"$dir" $HOME/.gitconfig
    fi
fi
