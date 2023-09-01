export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git themes debian aliases command-not-found zsh-interactive-cd web-search )
source $ZSH/oh-my-zsh.sh

alias editzsh="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"

# para arch linux
alias yupdate="sudo pacman -Syu"
alias yinstall="yay -S"
alias ysearch="yay -Ss"

# para debian/ubuntu
alias ainstall="sudo apt install -y"
alias asearch="sudo apt search"
alias aupdate="sudo apt update"
