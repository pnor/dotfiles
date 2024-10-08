#!/usr/bin/env zsh

# zshrc for Arch Linux (^:


# ===== Early Init and Instant Prmopt ==============================================================
# Things that should happen before the call to powerline10k instant prompt (or immediately after)

if command -v direnv &> /dev/null; then
  emulate zsh -c "$(direnv export zsh)"
fi

## - powerline10k instant prompt
if ((  ${+INSIDE_EMACS} )) && [[ -d "$HOME/powerlevel10k" ]]; then
    # Enable Powerlevel10k instant prompt (Should stay close to the top of ~/.zshrc)
    # ! Init code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi


if command -v direnv &> /dev/null; then
  emulate zsh -c "$(direnv hook zsh)"
fi

# ===== Plugins ================================================================

source "$HOME/.zsh/miniplug.zsh"
export MINIPLUG_HOME="$HOME/.zsh/plugins"
miniplug plugin 'MenkeTechnologies/zsh-more-completions'
miniplug plugin 'agkozak/zsh-z'
miniplug plugin 'hlissner/zsh-autopair'
miniplug plugin 'qoomon/zsh-lazyload'
miniplug plugin 'randomphrase/vterm-zsh-plugin'
miniplug plugin 'zpm-zsh/clipboard'
miniplug plugin 'zsh-users/zsh-autosuggestions'
miniplug plugin 'zsh-users/zsh-completions'
miniplug plugin 'zsh-users/zsh-history-substring-search'
miniplug plugin 'zsh-users/zsh-syntax-highlighting'

miniplug load

# zsh-history-substring-search
bindkey  history-substring-search-up
bindkey   history-substring-search-down
# autopair
autopair-init
# zsh autosuggestions
ZSH_AUTOSUGGEST_STRATEGY=(history match_prev_cmd completion)
# completions
autoload -Uz compinit
compinit -C


# ===== Shell Behaviour =========================================================

if [ -d "$HOME/powerlevel10k" ];  then
    ## Powerline 10k
    source ~/powerlevel10k/powerlevel10k.zsh-theme
    # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
    [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
else
    echo "(p10k isn't installed)"
fi
# --- Longer/Persistent Shell History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=20000
SAVEHIST=10000
setopt INC_APPEND_HISTORY

# --- Exported Variables
export EDITOR="vim"
export MAKEFLAGS="-j8"

# ===== Commands, Alias, Keybinds ===============================================

# --- Keybinds
bindkey \^U backward-kill-line


# --- Custom Functions
# Convert .mov to .gif
# $1 input $2 output (new file)
movgif() {
  ffmpeg -y -i $1 -f image2pipe -vcodec ppm - | convert -delay 2 -loop 0 -layers Optimize - gif:- | gifsicle -d 3 -O3 -o $2
}
# Optimize gif so it takes less space
# $1 input $2 output (new gif file)
shrinkgif() {
    gifsicle -O3 --lossy=80 $1 -o $2
}

# Move something to a trash directory
trash() {
    mv "$@" ~/trash/
}

# --- Alias
## General
if type exa > /dev/null; then
  alias ls="exa --icons"
  alias l="exa --icons"
  alias ll="exa -l"
  alias la="exa -a --icons"
  alias sl="exa --icons"
  alias lsltr="ls -ltr"
else
  alias ls="ls --color=auto"
  alias l="ls"
  alias ll="ls -l"
  alias la="ls -a"
  alias sl="ls"
fi
alias open="xdg-open"
## sysadmin stuff
alias fix_wifi="sudo iw wlan0 set txpower fixed 10"
alias wifi_info="sudo iw wlan0 info"
alias tether="sudo pacman -S libimobiledevice"
alias untether="sudo pacman -R libimobiledevice usbmuxd"
alias spacs="sudo pacman -S"
## gparted
if type gparted > /dev/null; then
    alias gparted="( xhost +SI:localuser:root & sudo -EH gparted )"
fi

## Node Version Manager
if type nvm > /dev/null; then
  setup_nvm() {
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  }
  lazyload nvm -- 'setup_nvm'
fi

## Python Version Manager
if type pyenv > /dev/null; then
  setup_pyenv() {
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
  }
  lazyload pyenv -- 'setup_pyenv'
fi


## Python - Conda
if type conda > /dev/null ; then
  setup_conda() {
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    __conda_setup="$('/usr/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
      eval "$__conda_setup"
    else
      if [ -f "/usr/etc/profile.d/conda.sh" ]; then
        . "/usr/etc/profile.d/conda.sh"
      else
        export PATH="/usr/bin:$PATH"
      fi
    fi
    unset __conda_setup
    # <<< conda initialize <<<
  }
  lazyload conda -- 'setup_conda'
fi

## Vim
alias v="vim -u ~/.simplevimrc"
alias iv="vim"
alias vi="vim"
alias vis="vim -S Session.vim"
## git
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gb="git branch"
alias gch="git checkout"
alias gpu="git push"
alias gpl="git pull"
alias gcl="git clone"
alias gpsuo="git push --set-upstream origin"
alias glog="git log"
alias glogs="git log --stat"
alias ggraph="git log --graph --pretty=format:'%Cred%h%Creset - %Cgreen(%ad)%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset' --abbrev-commit --date=local"
## Python
alias venv='source venv/bin/activate' # activate venv
alias initvenv='python -m venv ./venv' # create venv with no site packages


# Latex
alias tlmgr='tllocalmgr'
## Emacs
alias ec='emacsclient'
alias emacs-fix='~/.local/share/scripts/emacs-fix/emacs-fix'
## Dotfiles repo
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dots='dot status'
alias dotc='dot commit -m'
## direnv
direnv_allow() {
  cat .envrc
  echo 'Are you sure you want to source this file? '
  read tmp
  if [[ tmp == 'y' ]]; then
    direnv allow
  fi
}
lazyload 'direnv allow' -- 'direnv_allow'
alias 'direnv allow'=''
## LEETCODE
if type leetcode > /dev/null; then
  alias leett='leetcode test'
  #alias leetget='~/bin_scripts/leetget.sh'
  #alias leetget='~/.local/share/scripts/'
fi

# Compilation Flags
# speedup compilation?
export CFLAGS="-pipe"
export CCFLAGS="-pipe"
export CXXFLAGS="-pipe"
export CPPFLAGS="-pipe"

# --- PATH
## Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
## Haskell
export PATH="$HOME/.cabal/bin:$PATH"
## Rust
export PATH="$HOME/.cargo/bin:$PATH"
## go
export PATH="$HOME/go/bin:$PATH"
## .local/bin
export PATH="$HOME/.local/bin:$PATH"

# ---
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

