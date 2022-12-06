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

This shell code offers some conveniences for git:

```bash
# git aliases to allow omitting "git " with virtually all git usage
alias status="git status"
alias gdiff="git diff" # diff would collide with /usr/bin/diff
alias restore="git restore"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias branch="git branch"
alias checkout="git checkout"
alias pull="git pull"
alias revert="git revert"
alias greset="git reset" # reset would collide with /usr/bin/reset
alias remote="git remote"

# command to accelerate simple git use: add, commit and push everything
gitty() {
    if [ "$1" = "" ] # don't do shit without a message
    then
        echo "🛑 gimmme some message!!!"
    else
        add .
        commit -m $1
        push

        remoteBranch=$(branch -r)
        echo "✅ pushed to:$remoteBranch"
    fi

    echo "🤪 https://www.urbandictionary.com/define.php?term=gitty"
}
```

## Free Clients

* [Sourcetree](https://www.sourcetreeapp.com)
* [GitKraken](https://www.gitkraken.com)
