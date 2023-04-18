# Mac Cheat Sheet

## Keyboard Shortcuts

| Intent | Key Command |
| --------- | ----------- |
| Rename a selected file, folder or Numbers cell | ⌥⏎ |
| Delete a selected file, folder or email | ⌘⌫ |
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