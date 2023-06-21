# Mac Cheat Sheet

## Keyboard Shortcuts

| Intent | Key Command |
| --------- | ----------- |
| Rename a selected file, folder or Numbers cell | ⌥⏎ |
| Delete a selected file, folder or email | ⌘⌫ |
| Open App Settings | ⌘, |
| Quit app | ⌘Q |
| Close window or tab | ⌘W |
| Show/hide hidden files | ⌘⇧. (Cmd Shift Dot) |

## Special Characters (US Keyboard)

| Character | Key Command          |
| --------- | -------------------- |
| ä         | ⌥u and then type "a" |
| €         | ⌥⇧2                  |
| –         | ⌥-                   |
| —         | ⌥⇧-                  |
| …         | ⌥:                   |
| ß         | ⌥s                   |
| •         | ⌥8                   |

## Code Ligatures

To get nice ligatures in code:

* Install [Fira Code](https://fonts.google.com/specimen/Fira+Code)
* Use it in Xcode, VSCode, Terminal, iTerm2 etc.
* in iTerm2:
  * Settings / Profile / your profile / Text / Font
  * Also check the checkbox "Use ligatures" and select font weight medium

## App Defaults

... can be managed with the command line app [defaults](https://support.apple.com/en-gb/guide/terminal/apda49a1bb2-577e-4721-8f25-ffc0836f6997/mac).

This is the best option to test the first launch of a macOS app under development, since just deleting the app's plist file or Container does not reliably do the job because of the intricate caching of macOS.

* show the defaults of an app: `defaults read -app <app-name>`
* clear the defaults of a macOS app: `defaults delete -app <app-name>`

## Mail Rules Bug

One of the oldest and most ridiculous bugs in Apple software is that Mail rules don't work – still in 2023.

* Rules are not applied automatically when the IMAP flag "seen" is already set when the email arrives in Mail. For example, spam filters or rules at your email service provider might set this flag.

* A work around is discussed [at superuser.com](https://superuser.com/questions/33177/apple-mail-doesnt-apply-rules-unless-i-choose-apply-rules-manually)

## Key Symbols

* ⌘
* ⇧
* ⌥
* ⌃
* ⏎
* ⌫
* ↑ ↓ ← →

## Install Ruby

The preinstalled Ruby on macOS is typically out of date, and how to update it is a moving target. But it's often needed, for instance to properly intall and use cocoapods.

Here are the steps that worked for me on April 26 on macOS 13.3.1 without ever having updated or installed Ruby on that system before:

1. Install [Homebrew](https://brew.sh):

    `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
2. Add the homebrew path to the environment variable "PATH" by adding this line to ~/.zshrc (necessary so that RVM will find Homebrew). Then restart your shell session (or terminal app):

    `export PATH="$PATH:/opt/homebrew/bin"`

3. [Install RVM](https://stackoverflow.com/questions/38194032/how-can-i-update-ruby-version-2-0-0-to-the-latest-version-in-mac-os-x-v10-10-yo) (Ruby Version Manager), then restart your shell session (or terminal app):

    `curl -sSL https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer | bash -s stable`

4. Install the latest version of Ruby:

    `rvm install ruby@latest`

5. Select the latest Ruby version as the default version:

    `rvm use ruby-3.1.1 --default` (replace "ruby-3.1.1" by your latest version)

6. [Update the RubyGems system software](https://stackoverflow.com/questions/60631953/warning-the-running-version-of-bundler-is-older-than-the-version-that-created-t) (was necessary to use cocoapods):

    `gem update —-system`

## Install Cocoapods

1. After selecting a new Ruby version as described above, it is necessary to (re-)install Cocoapods, since Cocoapods is installed for each version of Ruby in a location like `/Users/<user name>/.rvm/rubies/ruby-3.1.1/bin/pod`. Also, and in particular when installing a specific version of Cocoapods, it's best to first deinstall existing Cocoapods installations (and their dependencies): 

    `gem uninstall cocoapods` 
    
    `gem install cocoapods`
    
2. Before installing the cocoapods of a specific project, you may have to install its Ruby gems if there is a `Gemfile` in the project folder. Run this within the project folder:

    `bundle install`

    Note: If the Gemfile specifies a version for Cocoapods, it's best to have a compatible version installed (See step 1).

3. Finally install the Cocoapods of the project (within the project folder, where the `Podfile`is):

    `pod install`