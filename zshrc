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

# nvm
antigen bundle lukechilds/zsh-nvm

# fast prompt
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

# Tracks your most used directories, based on 'frecency'.
antigen bundle rupa/z

# Archives
antigen bundle extract

# Homebrew
antigen bundle brew
antigen bundle brew-cask

# fish-like syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting

# suggestions as you type
antigen bundle tarruda/zsh-autosuggestions

antigen apply

# Disable command corrections
setopt nocorrectall
