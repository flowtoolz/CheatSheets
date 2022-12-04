# Commands

### Navigate

| Intent | Example Command |
| - | - |
| open manual for a command | `man ls` |
| print working directory | `pwd` |
| change directory | `cd Some/Directory` |
| change director to home | `cd` |
| change directory to parent | `cd ..` |
| change directory to iCloud drive | `cd ~/Library/Mobile\ Documents/com~apple~CloudDocs` |

### Inspect Files & Folders

| Intent | Example Command |
| - | - |
| list content of working directory | `ls` |
| list all (also hidden) content of working directory | `ls -a` |
| list content of working directory recursively | `ls -R` |
| print file info | `file README.md` |
| print file content | `cat README.md` |
| print multiple file contents | `cat README.md FAQ.md` |
| find file in directory | `find Some/Directory -name text.txt` |
| find file in home directory | `find ~ -name text.txt` |
| find file on whole mac | `find / -name text.txt` |
| find file, suppressing error output | `find / -name text.txt 2>/dev/null` |
| search in file | `less README.md`, then `/faq` |
| open file in default app | `open README.md` |
| open working directory in Finder | `open .` |

### Modify Files & Folders

| Intent | Example Command |
| - | - |
| make file | `touch new-article.md` |
| make directory | `mkdir NewFolder` |
| rename file | `mv README.md README-renamed.md` |
| move file (or folder) | `mv README.md Target/Folder` |
| move all txt files | `mv *.txt Target/Folder` |
| move all files | `mv * Target/Folder` |
| copy file | `cp README.md README-copy.md` |
| copy file to folder | `cp README.md Target/Folder` |
| copy folder (copy recursively) | `cp -R MyFolder Into/ThisFolder` |
| remove file | `rm article.md` |
| remove folder (remove recursively) | `rm -R ImageFolder` |

### Combine Commands

| Intent | Example Command |
| - | - |
| (over-)write text in new or existing file | `echo "# My Title" > new-article.md` |
| append text to new or existing file | `echo "new note" >> notes.md` |
| write directory content list to file | `ls -l >> filesAndFolders.txt` |
| write content of 2 files to new file | `cat readme.md faq.md > docs.md` |

### Other

| Intent | Example Command |
| - | - |
| quit a running program/job/command | `q` |
| show calendar | `cal` |
| terminate a program (process) | `killall SomeAppName` |
| show terminal history | `history` |

# Shortcuts

* Clear terminal: ⌘K
* Increase Font Size: ⌘=
* Decrease Font Size: ⌘-
* Cancel a running program/job/command: Ctrl+C
* Show auto completion (only in [iTerm](https://iterm2.com)): ⌘;

# Configuration

* ⚠️ How to persist and load the shell customizations listed in this section:

  * Add them to [either](https://unix.stackexchange.com/questions/71253/what-should-shouldnt-go-in-zshenv-zshrc-zlogin-zprofile-zlogout) ~/.zshrc (Z-Shell Run Control) or ~/.zprofile (Z-Shell Profile)
  * And to load the changes, "resource" the respective file:

  ```bash
  source ~/.zshrc
  source ~/.zprofile
  ```

* See a clean, helpful, nice command line prompt:

  ```bash
  export PROMPT='🍏%1~: '
  ```

* Quickly access the iCloud drive directory:

  ```bash
  export cloud="/Users/seb/Library/Mobile Documents/com~apple~CloudDocs"
  alias cdc="cd '$cloud'"
  ```

  Then you can for example `ls $cloud`, `cd $cloud` and `cdc`.

* Quickly access your repositories directory (adjust the path):

  ```bash
  export repos="/Users/seb/Desktop/GitHub Repos"
  alias cdr="cd '$repos'"
  ```

  Then you can for example `ls $repos`, `cd $repos` and `cdr`.

* Quickly list directory content with all the useful options:

  ```bash
  alias lsl="ls -Fahl"
  ```

  Then you can `lsl Some/Folder`.

* Backup Flowlist data via existing script:

  ```bash
  alias bfl="'$cloud/FLOWLIST BACKUP/backup-beta.sh'"
  ```

* Quickly open the in Finder selected folder in a new Terminal or iTerm tab via a shortcut:
    1. Go to System Settings / Keyboard / Keyboard Shortcuts... / Services / Files and Folders
    2. Find the shortcut you want:
        * "New Terminal Tab at Folder" for Terminal
        * "New iTerm2 Tab Here" for iTerm
    3. Double click on the key command (or on "none" if there is none)
    4. Press Ctrl+T (Shift+Cmd+T for example didn't work since it's used by Finder)

* Clearly see which working directories are opened in the tabs:

    * Terminal:
        1. Go to Settings / Profiles / The profile you use / Tab
        2. Under "Title" deselect everything except for "Working directory of document"
        
    * iTerm (from [this comment](https://gist.github.com/phette23/5270658?permalink_comment_id=3020766#gistcomment-3020766)):
        1. Go to Settings / Profiles / The profile you use
        
        2. Under "Basics" / "Title" make sure only "Session" is selected
        
        3. Add this to ~/.zshrc:
            ```bash
            DISABLE_AUTO_TITLE="true"
            
            precmd() {
              # sets the tab title to current dir
              echo -ne "\e]1;${PWD##*/}\a"
            }
            ```

* Avoid error "Operation not permitted" (for example with command "find") by giving Terminal/iTerm full disk access:

    1. Go to System Settings / Privacy & Security / Full Disk Access
    2. Add or activate Terminal/iTerm in the list
    3. Relaunch Terminal/iTerm
