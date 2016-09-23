# Use local executables
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Prompt
[[ -f "$HOME/.zsh_prompt" ]] && source "$HOME/.zsh_prompt"

# Common
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"

# Fuzzy search
bindkey "^P" up-line-or-search

# Antigen
source `brew --prefix`/share/antigen/antigen.zsh

# oh-my-zsh
antigen use oh-my-zsh

local b="antigen-bundle"

# fast prompt
$b mafredri/zsh-async
$b sindresorhus/pure

# Tracks your most used directories, based on 'frecency'.
$b rupa/z

# Archives
$b extract

# Homebrew
$b brew
$b brew-cask

# fish-like syntax highlighting
$b zsh-users/zsh-syntax-highlighting

# suggestions as you type
$b tarruda/zsh-autosuggestions

antigen apply

# Disable command corrections
setopt nocorrectall
