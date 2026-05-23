# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Install

```sh
./install.sh
```

This stows all config packages to `$HOME`. Optionally install Homebrew formulae:

```sh
brew bundle --file=brewfile/.config/brewfile/Brewfile
```

## Packages

| Package    | Description                        |
| ---------- | ---------------------------------- |
| brewfile   | Homebrew formulae and casks        |
| ghostty    | Terminal emulator config           |
| git        | Git config, aliases, delta pager   |
| gnupg      | GPG agent with SSH support         |
| jiratui    | Jira TUI client                    |
| karabiner  | macOS keyboard customization       |
| lazygit    | Git TUI                            |
| lsd        | Modern ls replacement              |
| nvim       | Neovim (personal + work profiles)  |
| opencode   | AI coding agent config             |
| starship   | Shell prompt                       |
| tmux       | Terminal multiplexer config        |
| zed        | Zed editor                         |
| zsh        | Zsh shell config                   |

## Neovim Profiles

Two profiles managed via `NVIM_APPNAME`:

- **nvim-personal** — default, personal development
- **nvim-work** — work-specific tooling

Switch with the `vv` command.
