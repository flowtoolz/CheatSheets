# Git Cheat Sheet

## Commands

As a useful baseline, the listed commands apply to the whole repo folder. But many of them can also specify single files.

### Work

| Intent | Example Command |
| - | - |
| see overview of repo | `git status` |
| inspect unstaged changes | `git diff` |
| discard unstaged changes | `git restore .` |

### Stage

| Intent | Example Command |
| - | - |
| stage changes | `git add .` |
| inspect staged changes | `git diff --staged` |
| inspect staged & unstaged changes | `git diff HEAD` |
| unstage staged changes | `git restore --staged .` |

### Commit

| Intent | Example Command |
| - | - |
| commit staged changes | `git commit -m "Add feature"` |
| stage (add) [tracked](https://www.google.com/search?q=git+commit+%22-a%22) changes, then commit them | `git commit -am "Add feature"` |

### Branch

| Intent | Example Command |
| - | - |
| see branches | `git branch` |
| create branch (no switch) | `git branch develop` |
| switch to branch | `git switch develop` |
| create branch and switch to it | `git switch -c develop` |
| rename ("move") current branch | `git branch -m new-branch-name` |
| merge some other branch into current HEAD | `git merge ` |
| delete some other branch | `git branch -d develop` |
| delete some other branch with unmerged changes (force delete) | `git branch -D develop` |

### Sync

| Intent | Example Command |
| - | - |
| clone remote repo (creates repo folder in working directory) | git clone https://github.com/flowtoolz/CheatSheets |
| push local commits to specific remote branch | `git push develop`   |
| push and set the "upstream" remote branch (track it) | `git push -u develop` |
| push local commits to tracked remote branch | `git push` |
|  |  |

## Conflicts

... are marked in the conflicting file (in the HEAD) with this pattern:

```bash
<<<<<<< HEAD
# <the conflicting code in the HEAD (in the current local branch and commit)>
=======
# <the conflicting code on the other branch we are merging into the HEAD>
>>>>>>> name-of-other-branch
```

## Setup

Have a look at [this shell customization script](shell-customization-scripts/make-the-shell-great-again.sh). It offers some conveniences for git. 

You could "install" such a script file by loading it in ~/.zshrc via `source /path/to/my/shell-customization-script`.

The script offers two major conveniences:

1. A function to add, commit and push all unstaged changes like so:

    ```bash
    gitty "Fix UI bug"
    ```
    
2. Aliases that allow omitting "git " with all git commands

## Free Clients

* [Sourcetree](https://www.sourcetreeapp.com)
* [GitKraken](https://www.gitkraken.com)
