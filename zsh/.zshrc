# Add custom scripts
export PATH=/usr/local/opt/asdf/shims:/usr/local/bin:/usr/local/sbin:$PATH

export HOMEBREW_BREWFILE_APPSTORE=0

# Add Homebrew to PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

# load site-functions for autocomplete
autoload -Uz compinit
compinit

# Add common Homebrew paths
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Bun
export PATH=$PATH:$HOME/.bun/bin

# Locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Misc settings
export EDITOR=nvim
export TERM=xterm-ghostty

# Node
export npm_config_engine_strict=true
export npm_config_save=true
export npm_config_save_exact=true
export npm_config_init_license=MIT
export npm_config_init_author_name=Jeff Jewiss
export npm_config_init_author_email=jeff@jeffjewiss.com

# Mappings for Ctrl/Option-left-arrow and Ctrl/Option-right-arrow for
# moving across words.
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word

# GPG
export GPG_TTY=$(tty)
export SSH_AUTH_SOCK=${HOME}/.gnupg/S.gpg-agent.ssh

# Initialize asdf
source $HOME/.asdf/asdf.sh

# Elixir
export ERL_AFLAGS="-kernel shell_history enabled"
export PATH=~/Code/elixir-ls/release:$PATH

# Zed editor
if [[ ${TERM_PROGRAM} = "zed" ]]; then
    export EDITOR="zed --wait"
    export VISUAL="zed --wait"
fi

# Aliases

# Dir navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias ls='lsd'
alias l='lsd -l'
alias la='lsd -a'
alias lla='lsd -la'
alias lt='lsd --tree'
alias ll='lsd -lh'
alias lt='lsd --tree'
alias ld='lsd --tree --group-directories-first -hFaLg'

# Network
alias whats-my-ip="curl -s checkip.dyndns.org | grep -Eo '[0-9\.]+'"
alias whats-my-local-ip="ipconfig getifaddr en0"

# Git
alias fix="git diff --name-only | uniq | xargs nvim"

# Utilities
alias a="ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor"
alias b="bundle exec"
alias d="du -h -d=1"
alias df="df -h"
alias grep='GREP_COLOR="1;37;45" LANG=C grep --color=auto'
alias h="history"
alias nv="nvim ."
alias tma='tmux attach -d -t'


# autosuggest keybindings
bindkey '^w' autosuggest-execute
bindkey '^e' autosuggest-accept
bindkey '^u' autosuggest-toggle
bindkey '^L' vi-forward-word
bindkey '^k' up-line-or-search
bindkey '^j' down-line-or-search

# Brewfile
if [ -f $(brew --prefix)/etc/brew-wrap ];then
  source $(brew --prefix)/etc/brew-wrap
fi

# fzf via Homebrew
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi

# virtualenv
# source /usr/local/bin/virtualenvwrapper.sh

# Disable command corrections
setopt nocorrectall

# Mise
eval "$(mise activate zsh --shims)"

# Zoxide
eval "$(zoxide init zsh)"

# direnv
eval "$(direnv hook zsh)"

# zmx completions
if command -v zmx &> /dev/null; then
  eval "$(zmx completions zsh)"
fi

vv() {
  # Assumes all configs exist in directories named ~/.config/nvim-*
  local config=$(fd --max-depth 1 --glob 'nvim-*' ~/.config | fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0)

  # If I exit fzf without selecting a config, don't open Neovim
  [[ -z $config ]] && echo "No config selected" && return

  # Open Neovim with the selected config
  NVIM_APPNAME=$(basename $config) nvim $@
}

export NVIM_APPNAME=nvim-personal

zmx-select() {
  local display
  display=$(zmx list 2>/dev/null | while IFS=$'\t' read -r name pid clients created dir; do
    name=${name#session_name=}
    pid=${pid#pid=}
    clients=${clients#clients=}
    dir=${dir#started_in=}
    printf "%-20s  pid:%-8s  clients:%-2s  %s\n" "$name" "$pid" "$clients" "$dir"
  done)

  local output query key selected session_name
  output=$({ [[ -n "$display" ]] && echo "$display"; } | fzf \
    --print-query \
    --expect=ctrl-n \
    --height=80% \
    --reverse \
    --prompt="zmx> " \
    --header="Enter: select | Ctrl-N: create new" \
    --preview='zmx history {1}' \
    --preview-window=right:60%:follow \
  )
  local rc=$?

  query=$(echo "$output" | sed -n '1p')
  key=$(echo "$output" | sed -n '2p')
  selected=$(echo "$output" | sed -n '3p')

  if [[ "$key" == "ctrl-n" && -n "$query" ]]; then
    session_name="$query"
  elif [[ $rc -eq 0 && -n "$selected" ]]; then
    session_name=$(echo "$selected" | awk '{print $1}')
  elif [[ -n "$query" ]]; then
    session_name="$query"
  else
    return 130
  fi

  zmx attach "$session_name"
}

# zmx session picker
if command -v zmx &> /dev/null && command -v fzf &> /dev/null && [[ -z "$ZMX_SESSION" ]]; then
  zmx-select && exit
fi


######################
# Work configuration #
######################
if [[ -f ~/.config/private/work.zsh ]]; then
  source ~/.config/private/work.zsh
fi
