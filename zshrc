# Use local executables
export PATH=$HOME/.rbenv/bin:/usr/local/bin:/usr/local/sbin:$PATH

# Prompt
[[ -f "$HOME/.zsh_prompt" ]] && source "$HOME/.zsh_prompt"

# Common junk
[[ -s "$HOME/.commonrc" ]] && source "$HOME/.commonrc"

# Disable command corrections
setopt nocorrectall
