# Z Shell Cheat Sheet

* [Wikipedia article about Z Shell](https://en.wikipedia.org/wiki/Z_shell)

## Commands

### Navigate

| Intent | Example Command |
| - | - |
| open manual for a command | `man <command>` |
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
| open working directory in VS Code | `code .` |

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

## Keyboard Shortcuts

| Intent | Key Command |
| --- | --- |
| Clear terminal | ⌘K |
| Increase Font Size | ⌘= |
| Decrease Font Size | ⌘- |
| Cancel a running program/job/command | ⌃C |
| Show auto completion (only in [iTerm2](https://iterm2.com)) | ⌘; |
| Open URL (only in [iTerm2](https://iterm2.com)) | ⌘Click |

## Configuration

### Specific Customizations

* To pimp the shell, adapt [these example scripts](shell-customization-scripts/) and "install" them:

  1. Add something like this to ~/.zshrc (Z-Shell Run Control):
  
  ```shell
  # load shell customization
  scriptsFolder="/Users/seb/Desktop/GitHub Repos/CheatSheets/shell-customization-scripts"
  source "$scriptsFolder/make-the-shell-great-again.sh"
  source "$scriptsFolder/personalize-the-shell.sh"
  ```
  
  2. Load the change immediately by opening a new terminal window/tab or by "re-sourcing" the file:
  
  ```shell
  source ~/.zshrc
  ```
  
* To open an in Finder selected folder in a new Terminal or iTerm2 tab via a shortcut:

  1. Go to System Settings / Keyboard / Keyboard Shortcuts... / Services / Files and Folders
  2. Find the shortcut you want:
      * "New Terminal Tab at Folder" for Terminal
      * "New iTerm2 Tab Here" for iTerm2
  3. Double click on the key command (or on "none" if there is none)
  4. Press Ctrl+T (Shift+Cmd+T for example didn't work since it's used by Finder)

* Clearly see which working directories are opened in the tabs:

    * Terminal:
        1. Go to Settings / Profiles / The profile you use / Tab
        2. Under "Title" deselect everything except for "Working directory of document"
        
    * iTerm2 (from [this comment](https://gist.github.com/phette23/5270658?permalink_comment_id=3020766#gistcomment-3020766)):
        1. Go to Settings / Profiles / The profile you use
        
        2. Under "General" / "Basics" / "Title" make sure only "Session Name" is selected
        
        3. Use the example scripts documented above or manually add this to ~/.zshrc:
            ```bash
            DISABLE_AUTO_TITLE="true"
            
            precmd() {
              # sets the tab title to current dir
              echo -ne "\e]1;${PWD##*/}\a"
            }
            ```

* Avoid error "Operation not permitted" (for example with command "find") by giving Terminal/iTerm2 full disk access:

    1. Go to System Settings / Privacy & Security / Full Disk Access
    2. Add or activate Terminal/iTerm2 in the list
    3. Relaunch Terminal/iTerm

### Configuration Files: Overview

| File       | Loaded For                          | Purpose                             | Typical Configurations               |
|------------|-------------------------------------|-------------------------------------|--------------------------------------|
| `.zshenv`  | All zsh instances (scripts, login, interactive) | Universal settings for every zsh session | `ZDOTDIR`, minimal environment variables |
| `.zprofile`| Login sessions (terminal app launch) | Session-wide environment setup      | `PATH`, `JAVA_HOME`, one-time commands |
| `.zshrc`   | Interactive sessions (new tabs/windows) | Customizations for interactive sessions | Aliases, prompts, key bindings       |

#### 1. `.zshenv` – The Universal Configuration File
- **Purpose**: Sets up settings that apply to *every* zsh instance, whether it’s an interactive shell (where you type commands), a login shell (started when you launch a terminal app), or a non-interactive shell (like when you run a script).
- **When it’s loaded**: Always loaded first, no matter how zsh is started—terminal launch, new tab/window, or script execution. This makes it the foundation for all zsh sessions.
- **What goes here**: Universal environment variables or settings that need to be available everywhere.
- **Key distinction**: Since it’s loaded for non-interactive shells (e.g., scripts), avoid putting interactive-specific settings like aliases or prompt customizations here—they could interfere with script behavior.

#### 2. `.zprofile` – The Login Shell Setup
- **Purpose**: Configures the environment for *login shells*, which are typically started when you first launch a terminal application (e.g., iTerm2 or Terminal on macOS).
- **When it’s loaded**: Only when a login shell starts—usually when you open your terminal app for the first time after logging into your system or restarting your computer. It’s *not* loaded when you open a new tab or window within an existing terminal session, as those are usually interactive (non-login) shells.
- **What goes here**: Environment variables and one-time setup commands that should apply to the entire login session and be inherited by all child shells (like new tabs or windows).
- **Key distinction**: Unlike `.zshrc`, this file is only loaded for login shells, so it’s ideal for settings you want to apply once at the start of a session, not repeatedly for every new tab.

#### 3. `.zshrc` – The Interactive Shell Customizer
- **Purpose**: Customizes *interactive shells*, where you actively type commands and interact with the shell.
- **When it’s loaded**: Whenever an interactive shell starts, such as when you open a new tab or window in your terminal app. It’s also loaded after `.zprofile` when you launch a terminal (since the initial shell is usually both a login and interactive shell).
- **What goes here**: Settings that enhance your interactive experience, like aliases, prompt designs, key bindings, and shell functions.
- **Key distinction**: This file is reloaded every time you open a new interactive shell, so changes (like adding a new alias) take effect in new tabs/windows without needing to restart the terminal. It’s not loaded for scripts, keeping it focused on interactive use.