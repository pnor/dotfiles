#!/usr/bin/env zsh

# Script for getting the common depencies I use in my zshrc
# - things like the plugins mostly

# Usage:
# setup_zsh.zsh <option>
# - <option> is things to install
# Example:
# setup_zsh.zsh miniplug
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color


help() {
    echo "usage: setup_zsh <option>"
    echo "available: ${CYAN}[ miniplug, p10k ]${NC}"
}

install_miniplug() {
    install_location="$HOME/.zsh"

    echo "starting to install ${GREEN}miniplug${NC}"
    curl -sL --create-dirs \
        https://git.sr.ht/~yerinalexey/miniplug/blob/master/miniplug.zsh \
        -o $install_location/miniplug.zsh
    echo "finished installing ${GREEN}miniplug${NC}!"
    echo "placed file in ${CYAN}$install_location${NC}!"

}

install_p10k() {
    echo "starting to install ${GREEN}powerline10k${NC}"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
    echo "finished installing ${GREEN}powerline10k${NC}!"
}


#
# ===============
#

case "$1" in
    "miniplug")
        install_miniplug
        ;;
    "install_p10k")
        install_p10k
        ;;
    *)
        help
esac
