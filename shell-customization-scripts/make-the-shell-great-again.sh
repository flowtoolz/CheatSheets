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

# aliases that allow omitting "git " with virtually all git usage
alias status="git status"
alias diff="git diff" # this masks /usr/bin/diff
alias restore="git restore"
alias add="git add"
alias commit="git commit"
alias push="git push"
alias branch="git branch"
alias merge="git merge"
alias switch="git switch"
alias checkout="git checkout"
alias pull="git pull"
alias revert="git revert"
alias reset="git reset" # this masks /usr/bin/reset
alias remote="git remote"
alias log="git log" # this masks /usr/bin/log

# command to accelerate the most basic git use: add, commit and push all changes
gitty() {
    changes=$(diff)

    if [ "$changes" = "" ] # don't do shit without unstaged changes
    then
        echo "🛑 No unstaged changes!!!"
    elif [ "$1" = "" ] # don't do shit without a message
    then
        echo "🛑 Write a commit message!!!"
    else
        add .
        commit -m $1
        push

        lastCommit=$(log --oneline -1)
        echo "✅ Pushed $lastCommit"
    fi

    echo "🤪 https://www.urbandictionary.com/define.php?term=gitty"
}