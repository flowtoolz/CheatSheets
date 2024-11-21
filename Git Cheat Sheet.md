# Git Cheat Sheet

## Commands

* As a useful baseline, the listed commands apply to the whole repo folder. But many of them can also specify files.
* For brevity, example commands omit the redundant "`git `". Read [Setup](#Setup) on how to actually avoid typing that.
* Note that the default name of remotes is "origin". That's not a git term but a changable name specific to the local copy of the repository. 

### Setup Repository

| Intent | Example Command |
| - | - |
| turn working directory into git repo (creates .git directory) | `init` |
| see global user name (from global git config file) | `config user.name` |
| see local user name (from local repo git config file) | `config --local user.name` |
| see the tracked remotes (verbose) | `remote -v` |
| set upstream (tracked) remote branch for current local branch | `branch -u remote-name/branch-name` |

### Inspect & Work

| Intent | Example Command |
| - | - |
| see overview of repo | `status` |
| see all commits in compact form | `log --oneline` |
| see last N commits in compact form | `log --oneline -N` |
| inspect unstaged changes | `diff` |
| discard unstaged changes | `restore .` |
| see all tags | `tag` |
| see (list) specific tags filtered by a search pattern (like "v3.*") | `tag -l search-pattern` |
| go to specific tag (detaching HEAD ...) | `checkout tag-name` |
| inspect changes between tags | `diff tag-name other-tag-name` |
| add tag to HEAD (to last commit on current branch) | `tag tag-name` |
| add tag to specific commit | `tag tag-name commit-hash` |
| delete a tag | `tag -d tag-name` |
| add annotated tag to HEAD | `tag -a tag-name` |
| show annotations of an annotated tag | `show tag-name` |
| show reference logs | `reflog show` |

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
| push local tags to tracked remote branch | `push --tags` |
| push a specific tag to a remote | `push remote-name tag-name` |
| push local commits to specific remote branch | `push remote-branch-name` |
| push and set the "upstream" remote branch (track it) | `push -u remote-branch-name` |
| update local representation of tracked remote branche | `fetch`                                          |
| merge tracked remote branch into current branch | `pull` |
| merge specific remote branch into current branch | `pull remote-name branch-name` |
| rebase the current branch onto another (often its root-) branch | `rebase other-branch-name` |
| abort a partial (because conflicting) rebase | `rebase --abort` |
| continue a partial (conflicting) rebase after resolving the conflicts | `rebase --continue` |
| interactively rebase (change) the last N commits of the current branch | `rebase -i HEAD˜N` |

* Rebasing a child branch onto its parent branch will not create commits for potential previous merge commits where the parent had been merged into the child to keep the child up to date. But then where do the potential changes go that could have been made in the merge commits, in particular if those merges involved resolving conflicts?

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

### Shell Authentication

* GitHub and most other git hosts do not support password authentication anymore, so on the command line you'll authenticate either via a PAT or via an SSH key.

* When using a PAT: To cache/remember the PAT (password), run `git config --global credential.helper osxkeychain`. This way you don't need to enter the PAT everytime git needs to authenticate.

### Shell Commands

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
