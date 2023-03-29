# Swift Cheat Sheet

## Package

* Usage: `swift package <subcommand>`
* See help and options: `swift help package`

| Package Subcommand | Intent |
| - | - |
| clean | Delete build artifacts |
| purge-cache | Purge the global repository cache. |
| reset | Reset the complete cache/build directory |
| update | Update package dependencies |
| describe | Describe the current package |
| init | Initialize a new package |
| _format |  |
| diagnose-api-breaking-changes | Diagnose API-breaking changes to Swift modules in a package |
| dump-symbol-graph | Dump Symbol Graph |
| dump-pif | |
| dump-package | Print parsed Package.swift as JSON |
| edit |Put a package in editable mode|
| unedit |Remove a package from editable mode|
| config |Manipulate configuration of the package|
| resolve |Resolve package dependencies|
| show-dependencies |Print the resolved dependency graph|
| tools-version |Manipulate tools version of the current package|
| compute-checksum |Compute the checksum for a binary artifact.|
| archive-source |Create a source archive for the package|
| completion-tool |Completion tool (for shell completions)|
| plugin |Invoke a command plugin or perform other actions on command plugins |

## Build

* Usage: `swift build <options>`
* See help and options: `swift help build`

## Test

* Usage: `swift test <options> <subcommand>`
* See help and options: `swift help test`

| Test Subcommand | Intent |
| - | - |
| list | Lists test methods in specifier format |