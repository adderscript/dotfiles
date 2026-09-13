alias ls="ls --color=auto"

autoload -U compinit && compinit

eval "$(starship init zsh)"
eval "$(zoxide init --cmd cd zsh)"
