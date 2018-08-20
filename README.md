![dotfiles](readme/dotfiles.png)

*Dotfiles sharing is caring*

---

### Basic Setup

The basic setup I'm running (as taken from [neofetch](https://github.com/dylanaraps/neofetch)):

**OS**: Arch Linux x86_64

**Shell**: zsh

**WM**: i3

**Terminal**: xterm

---

### What you can find here

* Scripts
  * fgr - Find Git Repos. Goes through a given directory and tries to find if a git repository exists. Helpful when you don't know how many git repositories you have and you want to organize them.
  * npc - Not Pushed Commits. Goes through your git repos and checks if any of them have un-pushed comments to `origin`. Helpful when you are at the end of the day and forgot to sync in something.
  * ncc - Not Commited Changes. Goes through your git repos and checks if there are un-commited changes.
  * repos - A merge between npc/ncc.
  * shdwn - Before shutting down, it check if there isn't any un-commited and un-pushed code.
  * zsh jumpstart - A script that jumpstarts my default shell configuration. *WIP*.
  * installer script - An installer scrip that jump starts my default OS configuration. *WIP*.
  * alarme - A notification system for the desktop. *WIP*.

---

### Workflow

Emacs, forked from [purcell](https://github.com/purcell/emacs.d), [i3-gaps](https://github.com/Airblader/i3), [polybar](https://github.com/jaagr/polybar), and `xterm` with `zsh` + [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) + [powerlevel9k](https://github.com/bhilburn/powerlevel9k).

Also you can checkout my [todo](http://htmlpreview.github.io/?https://github.com/Anarcroth/dotfiles/blob/master/todo.html) list. This way I can open it whenever or wherever I am. I try to keep it in sync.

You might also find some useful things in the `useful_commands.md` file, where I keep references to rarely used, yet very helpful one liners, setup steps, execution patterns, and more!

My `git` setup isn't the best, but you might find some interesting aliases there. Most of the things are generated from the `oh-my-zsh` framework with the `git` plugin tho.
