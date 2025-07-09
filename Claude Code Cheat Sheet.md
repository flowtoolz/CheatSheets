# Claude Code CLI Cheat Sheet

## Getting Started

| Intent | Command | Description |
|---|---|---|
| Install Node.js & npm | `brew install node` | Install Node.js and npm using Homebrew (if not already installed). |
| Install Claude CLI | `npm install -g @anthropic-ai/claude-code` | Install Claude Code CLI globally to use it from anywhere. |
| Configure | `claude config set --global preferredNotifChannel terminal_bell` | Set a terminal bell to notify when a long task is complete. |
| Start Chat | `claude` | Begin a new chat session with a clean context. |
| Continue Chat | `claude --continue` or `claude -c` | Resume the last chat session with its context. |
| Resume Session | `claude --resume` or `claude -r` | List past sessions and jump back into a specific one. |
| Run One-off Prompt | `claude -p "your prompt"` | Execute a single prompt and get the response without entering interactive mode. |

## Core Workflow: Slash Commands & Memory

| Command / Shortcut | Description |
|---|---|
| `/init` | Creates a `CLAUDE.md` file in the project root to store project context for Claude. |
| `/clear` | Resets the current session's context, useful for switching tasks. |
| `/compact` | Summarizes the conversation to manage context length. |
| `/review` | Requests a review of a pull request, file, or code block. |
| `/help` | Lists all available slash commands and their functions. |
| `/model` | Switch between Claude models (e.g., Opus for deep thinking, Sonnet for speed). |
| `/memory` | Opens the relevant `CLAUDE.md` memory file in your default editor for more detailed edits. |
| `# <your text>` | At the start of a prompt, this shortcut lets you quickly add a new line to a memory file. You'll be prompted to choose which file. |

## Advanced Arsenal

| Concept | Command/Action | Description |
|---|---|---|
| Custom Commands | Create `.md` files in `.claude/commands` | Define your own slash commands for custom automation (e.g., running tests). |
| Add MCPs | `claude mcp add <name> <package>` | Add a "Managed Component" to give Claude new capabilities, like browser control with Playwright. |
| Permissions | Edit `.claude/settings.json` | Whitelist or blacklist commands to control Claude's capabilities. |
| Track Usage | `npx ccusage@latest` | Monitor token usage and estimate costs. |
| Deep Brainstorming| `> ultrathink <topic>` | Get a structured, multi-step answer for complex topics. |

## User Memory

Locates at `~/.claude/CLAUDE.md`

Example:

```
## Verbal Answers

* Keep answers succinct and to the point. I will just ask more questions when I want elaboration.
* I am an expert Swift developer who knows programming concepts. So don't explain programming concepts unless I ask for them.
* I am new to Python and learning Python. So when answering my questions, please do explain Python code where relevant, in particular where it is different from Swift and where the differences might derail a seasoned Swift developer.

## Code Generation

* Beware of overengineering. Always start with the simplest possible solution.
* Give a brief explanation of your intent before every code change that you suggest. That helps me tracking your chain of thoughts. One or two lines is enough.
* Never run the project itself that we're workin on unless I ask you to do so. For testing stick to ad-hoc scripts and commands. The project itself might produce costs or exhaust API quotas like requests per day.
```