#! /bin/zsh

# You may use this script as a template to make a shell great again. It should not reference personal folders.
# "Install" this script file by adding "source path/to/this/file" to your ~/.zshrc

# list folder content with useful options 
alias lsl="ls -Fahl"

# print the paths in the $PATH variable as a readable list
alias paths="echo $PATH | tr : '\n'"

# nice prompt
export PROMPT='🍏%1~: '

# working directory as tab title in iTerm (https://iterm2.com)
DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

# make VS Code the default editor, assuming the VS Code command is installed
export EDITOR="code -w" 

# aliases that allow omitting "git " with git commands
alias status="git status"
alias diff="git diff" # this masks /usr/bin/diff
alias restore="git restore"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias branch="git branch"
alias clone="git clone"
alias merge="git merge"
alias rebase="git rebase"
alias reflog="git reflog"
alias tag="git tag"
alias switch="git switch"
alias checkout="git checkout"
alias fetch="git fetch"
alias pull="git pull"
alias revert="git revert"
alias reset="git reset" # this masks /usr/bin/reset
alias remote="git remote"
alias log="git log" # this masks /usr/bin/log
alias config="git config"
alias init="git init"

# Gitty: A "Save & Sync" Command for Your Code
#
# This script automates the most common Git workflow: adding all changes,
# committing them with a message, and pushing them to the remote repository.
#
# WHY IT'S USEFUL:
# It's designed for a rapid development cycle where you commit frequently
# and push immediately for backup and collaboration. This streamlines the
# 98% of Git usage that is "add all -> commit -> push", removing repetitive
# steps while still requiring a thoughtful commit message.
#
# USAGE:
# gitty "Your commit message here"
#
# For the 2% of cases requiring more granular control (like selective
# staging or complex branch operations), the standard Git commands can
# still be used directly.
gitty () {
    changes=$(status --porcelain)

    if [ -z "$changes" ]; then
        echo "🛑 No changes to commit"
    elif [ -z "$1" ]; then
        echo "🛑 No commit message"
    else
        add .
        commit -m "$1"
        push
        lastCommit=$(log --oneline -1)
        echo "✅ Pushed $lastCommit"
    fi

    echo "🤪 https://www.urbandictionary.com/define.php?term=gitty"
}