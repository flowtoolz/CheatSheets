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
    sourceFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta/"

    # define where to store the backup
    destinationFolder="$cloud/FLOWLIST BACKUP/Flowlist-Beta/"

    # update the destination folder, deleting files that aren't anymore in the source folder
    rsync -a --delete $sourceFolder $destinationFolder
}

find-flowlist-duplicates() {
    flowlistItemsFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta/Items"
    find $flowlistItemsFolder -name "* *.json"
}

delete-flowlist-duplicates() {
    flowlistItemsFolder="/Users/seb/Library/Containers/com.flowtoolz.flowlist/Data/Documents/Flowlist-Beta/Items"
    find $flowlistItemsFolder -name "* *.json" -delete
}