# Git Cheat Sheet

## Commands

* As a useful baseline, the listed commands apply to the whole repo folder. But many of them can also specify files.
* For brevity, example commands omit the redundant "`git `". Read [Setup](#Setup) on how to actually avoid typing that.
* Note that the default name of remotes is "origin". That's not a git command but a changable name specific to the local copy of the repository. 

### Inspect & Work

| Intent | Example Command |
| - | - |
| see overview of repo | `status` |
| inspect unstaged changes | `diff` |
| discard unstaged changes | `restore .` |
| print infos about the tracked remote (verbose) | `remote -v` |

### Stage

| Intent | Example Command |
| - | - |
| stage changes | `add .` |
| inspect staged changes | `diff --staged` |
| inspect staged & unstaged changes | `diff HEAD` |
| unstage staged changes | `restore --staged .` |

### Commit

| Intent | Example Command |
| - | - |
| commit staged changes | `commit -m "Add feature"` |
| stage (add) [tracked](https://www.google.com/search?q=git+commit+%22-a%22) changes, then commit them | `commit -am "Add feature"` |

### Branch & Merge

| Intent | Example Command |
| - | - |
| see local branches | `branch` |
| see remote branches | `branch -r` |
| create branch (no switch) | `branch develop` |
| switch to branch | `switch develop` |
| create branch and switch to it | `switch -c develop` |
| rename ("move") current branch | `branch -m new-branch-name` |
| merge some other branch into current HEAD | `merge other-branch` |
| delete some other branch | `branch -d develop` |
| delete some other branch with unmerged changes (force delete) | `branch -D develop` |

### Sync

| Intent | Example Command |
| - | - |
| clone remote repo (creates folder for whole repo) | `clone repo-url` |
| add remote (for example the original repo of a fork) | `remote add remote-name repo-url` |
| switch to new local branch tracking other remote branch | `switch remote-branch-name` |
| push local commits to tracked remote branch | `push` |
| push local commits to specific remote branch | `push remote-branch-name` |
| push and set the "upstream" remote branch (track it) | `push -u remote-branch-name` |
| update local representation of tracked remote branche | `fetch`                                          |
| merge tracked remote branch into current branch | `pull` |
| merge specific remote branch into current branch | `pull remote-name branch-name` |

## Conflicts

... are marked in the conflicting file (in the HEAD) with this pattern:

```bash
<<<<<<< HEAD
# <the conflicting code in the HEAD (in the current local branch and commit)>
=======
# <the conflicting code on the other branch we are merging into the HEAD>
>>>>>>> name-of-other-branch
```

## GitHub Features

Some common GitHub workflows rely on features that are **not** part of git but of GitHub itself, for example:

* Pull Requests
* Forks

## Setup

### Shell

Have a look at [this shell customization script](shell-customization-scripts/make-the-shell-great-again.sh). It offers some conveniences for git. 

You could "install" such a script file by loading it in ~/.zshrc via `source /path/to/my/shell-customization-script`.

The script offers two major conveniences:

1. A function to add, commit and push all unstaged changes like so:

    ```bash
    gitty "Fix UI bug"
    ```

2. Aliases that allow omitting "``git ``" with all git commands

### Font

* To have nice code-oriented ligatures, use the [Fira Code font](https://fonts.google.com/specimen/Fira+Code) and (in iTerm) activate ligatures.

## Free Clients

* [Sourcetree](https://www.sourcetreeapp.com)
* [GitKraken](https://www.gitkraken.com)
