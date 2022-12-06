# Git Cheat Sheet

## Commands

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

### Push

| Intent | Example Command |
| - | - |
| push local commits to specific remote branch | `git push develop`   |
| push and set the "upstream" remote branch (track it) | `git push -u develop` |
| push local commits to tracked remote branch | `git push` |

## Setup

Have a look at [this shell customization script](shell-customization-scripts/make-the-shell-great-again.sh). It offers some conveniences for git. 

You could "install" such a script file by loading it in ~/.zshrc via `source /path/to/my/shell-customization-script`.

For example, the script offers a function to add, commit and push all changes like so:

```bash
gitty "Fix UI bug"
```

## Free Clients

* [Sourcetree](https://www.sourcetreeapp.com)
* [GitKraken](https://www.gitkraken.com)
