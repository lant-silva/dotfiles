export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git themes debian aliases command-not-found zsh-interactive-cd web-search )
source $ZSH/oh-my-zsh.sh

alias editzsh="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias pi="sudo pacman -S"
alias ps="sudo pacman -Ss"
alias pupd"sudo pacman -Syu"
alias yi="yay -S"
alias ys="yay -Ss"
