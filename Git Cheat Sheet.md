## Commands

| Intent | Example Command |
| - | - |
| see overview of repo | `git status` |
| inspect unstaged changes | `git diff` |
| discard unstaged changes | `git restore .` |
|  |  |
| stage changes                                        | `git add .`                    |
| inspect staged changes                               | `git diff --staged`            |
| inspect staged & unstaged changes                    | `git diff HEAD`                |
| unstage staged changes                               | `git restore --staged .`       |
|                                                      |                                |
| commit staged changes | `git commit -m "Add feature"` |
| stage (add) [tracked](https://www.google.com/search?q=git+commit+%22-a%22) changes, then commit them | `git commit -am "Add feature"` |
|  |  |
| push local commits to specific remote branch | `git push develop`   |
| push and set the "upstream" remote branch (track it) | `git push -u develop` |
| push local commits to tracked remote branch | `git push` |
|                                                      |                                |
|                                                      |                                |
|                                                      |                                |
|                                                      |                                |
|                                                     |                                |
