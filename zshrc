# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

_has() {
  type "$1" &> /dev/null
}

# Common
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"

# Fuzzy search
bindkey "^P" up-line-or-search

# Antigen
source `brew --prefix`/share/antigen/antigen.zsh

# fast prompt
antigen bundle mafredri/zsh-async

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

# theme
antigen theme romkatv/powerlevel10k

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

# virtualenv
source /usr/local/bin/virtualenvwrapper.sh

# Disable command corrections
setopt nocorrectall

# direnv
eval "$(direnv hook zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
