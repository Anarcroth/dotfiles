# Git hooks

These are git hooks that would _potentially reduce_ the risk of committing or pushing wrong or inappropriately formatted information to a git repo.

## Installation

These git hooks come with an installer script. When run, the installer shall copy the files from this directory to a desired place (or if no path is passed, the installer shall use current directory) and configure the hooks there.

```bash
bash install.sh
```

## Configuration

The following git hooks - `pre-commit`, `prepare-commit-msg` and `pre-push`, have special variables that can be configured through the `git-hook-variables.yaml` file. In this file, the different variables used in these hooks are described and can be changed.

**Note:** changing these variables *should* not break the hooks, but rather alter their behavior, so that it suits your specific personal use-case.

Each of these three git hooks starts off with the following lines:

``` bash
# Get pre-<hook_name> variables
source ~/path/to/git-hook-helper.sh
create_variables ~/path/to/git-hook-variables.yaml
```

Currently, there isn't a more elegant way to import these variables to the hooks, but once you set it up, you shouldn't have a reason to change it anymore.

Additionally, you can also configure to have a *main* directory for all your hooks. In your personal `~/.gitconfig` file, add these lines so that your hooks are centralized.

``` bash
[core]
        hooksPath = ~/dotfiles/git/hooks
```

Keep in mind that this variable should already be set if the hooks were installed with the provided installer.

**Note 2:** the `commit-msg` hooks requires python3.

## Usage

`pre-commit` - called before executing `git commit`
`commit-msg` - called before finishing `git commit`
`pre-merge-commit` - called before executing `git merge`
`pre-push` - called before executing `git push`
`pre-rebase` - called before executing `git rebase`
`prepare-commit-msg` - called during `git commit`
