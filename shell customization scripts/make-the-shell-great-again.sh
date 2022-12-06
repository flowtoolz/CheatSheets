#! /bin/zsh

# You may use this script as a template to make any shell great again. It should not reference personal folders.
# "Install" this script file by adding "source path/to/this/file" to your ~/.zshrc

# list folder content with useful options 
alias lsl="ls -Fahl"

# print the paths in the $PATH variable as a readable list
alias paths="echo $PATH | tr : '\n'"

# nice prompt
export PROMPT='🍏%1~: '

# working directory as tab title in iTerm
DISABLE_AUTO_TITLE="true"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}

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

# command to accelerate the most basic git use: add, commit and push all changes
gitty() {
    if [ "$1" = "" ] # don't do shit without a message
    then
        echo "🛑 gimmme some message!!!"
    else
        add .
        commit -m $1
        push

        echo "✅ pushed:"
        branch -vv
    fi

    echo "🤪 https://www.urbandictionary.com/define.php?term=gitty"
}