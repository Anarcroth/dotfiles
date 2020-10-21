# Git hooks

These are (to my experience) useful git hooks that would *reduce* the risk of committing or pushing wrong or inappropriately formatted information to a git repo.

## Configuration

The following git hooks - `pre-commit`, `prepare-commit-msg` and `pre-push`, have special variables that can be configured through the `git-hook-variables.yaml` file. In this file, the different variables used in these hooks are described and can be changed.

**Note:** changing these variables *should* not break the hooks, but rather alter their behavior, so that it suits your specific personal use-case.

Each of these three git hooks starts off with the following lines:

``` bash
# Get pre-commit variables
source ~/path/to/git-hook-helper.sh
create_variables ~/path/to/git-hook-variables.yaml
```

Currently, there isn't a more elegant way to import these variables to the hooks, but once you set it up, you shouldn't have a reason to change it anymore.

Additionally, you can also configure to have a *main* directory for all your hooks. In your personal `~/.gitconfig` file, add these lines so that your hooks are centralized.

``` bash
[core]
        hooksPath = ~/dotfiles/git/hooks
```

**Note 2:** the `commit-msg` hooks requires python3.

## Usage

`pre-commit` - called only by `git commit`
`commit-msg` - called by finishing `git commit`
`pre-merge-commit` - called only by `git merge`
`pre-push` - called only by `git push`
`pre-rebase` - called only by `git rebase`
`prepare-commit-msg` - called only by `git commit`
