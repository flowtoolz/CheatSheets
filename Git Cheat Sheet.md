# Git Cheat Sheet

## Commands

* As a useful baseline, the listed commands apply to the whole repo folder. But many of them can also specify files.
* For brevity, example commands omit the redundant "`git `". Read [Setup](#Setup) on how to actually avoid typing that.

### Work

| Intent | Example Command |
| - | - |
| see overview of repo | `status` |
| inspect unstaged changes | `diff` |
| discard unstaged changes | `restore .` |

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

### Branch

| Intent | Example Command |
| - | - |
| see branches | `branch` |
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
| clone remote repo (creates repo folder in working directory) | `clone https://github.com/flowtoolz/CheatSheets` |
| push local commits to specific remote branch | `push develop`   |
| push and set the "upstream" remote branch (track it) | `push -u develop` |
| push local commits to tracked remote branch | `push` |

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
