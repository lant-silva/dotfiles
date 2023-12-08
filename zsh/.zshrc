export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"

plugins=(git themes aliases command-not-found zsh-interactive-cd web-search )
source $ZSH/oh-my-zsh.sh

alias editzsh="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"

# para arch linux
alias yu="sudo pacman -Syu"
alias yi="yay -S --confirm"
alias ys="yay -Ss"
alias yr="yay -R"

# para debian/ubuntu
alias ai="sudo apt install -y"
alias as="sudo apt search"
alias au="sudo apt update"

# baixar musicas(yt-dlp)
alias m4a="yt-dlp -f m4a"

# baixar videos(yt-dlp)
alias mp4="yt-dlp -f mp4"
