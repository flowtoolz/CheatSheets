#! /bin/zsh

# You may use this script as a template to personalize your shell. It may reference personal folders.
# "Install" this script file by adding "source path/to/this/file" to your ~/.zshrc

# access frequently used folders
export cloud="/Users/seb/Library/Mobile Documents/com~apple~CloudDocs/iCloud"
alias cdc="cd '$cloud'"

export repos="/Users/seb/Desktop/GitHub Repos"
alias cdr="cd '$repos'"

# backup Flowlist (http://www.flowlistapp.com)
bfl() {
    # remember the working directory where we started off
    workingDirectory=$(pwd) 

    # define the data folder we want to backup
    dataFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents"
    folderToBackup="Flowlist-Beta"

    # define the folder in which to store the backup
    backupFolder="$cloud/FLOWLIST BACKUP"

    # create the backup
    cd $dataFolder
    zip -r "$backupFolder/$folderToBackup" $folderToBackup

    # go back to the working directory where we started off
    cd $workingDirectory 
}