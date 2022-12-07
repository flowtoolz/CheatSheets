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
    # define what to backup
    folderToBackup="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta"

    # define where to store the backup
    backupFolder="$cloud/FLOWLIST BACKUP"

    # copy the folder to backup to the backup folder
    cp -R $folderToBackup $backupFolder
}

find-flowlist-duplicates() {
    flowlistItemsFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta/Items"
    find $flowlistItemsFolder -name "* *.json"
}

delete-flowlist-duplicates() {
    flowlistItemsFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta/Items"
    find $flowlistItemsFolder -name "* *.json" -delete
}