_has() {
  type "$1" &> /dev/null
}

# Prompt
[[ -f "$HOME/.zsh_prompt" ]] && source "$HOME/.zsh_prompt"

# Common
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"

# Fuzzy search
bindkey "^P" up-line-or-search

# Antigen
source `brew --prefix`/share/antigen/antigen.zsh

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

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# fzf + ag configuration
if _has fzf && _has ag; then
  export FZF_DEFAULT_COMMAND='ag -g ""'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND"
fi

# Disable command corrections
setopt nocorrectall
