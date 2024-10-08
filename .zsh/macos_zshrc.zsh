#!/usr/bin/env zsh

# zshrc for MacOS 🍎

# ===== Early Init and Instant Prmopt ==============================================================
# Things that should happen before the call to powerline10k instant prompt (or immediately after)

# move the homebrew things first, to avoid using macos git (slow)
export PATH="/usr/local/bin:${PATH}"

if command -v direnv &> /dev/null; then
  emulate zsh -c "$(direnv export zsh)"
fi

## - powerline10k instant prompt
if [[ -v INSIDE_EMACS ]]; then
    # Enable Powerlevel10k instant prompt (Should stay close to the top of ~/.zshrc)
    # ! Init code that may require console input (password prompts, [y/n]
    # confirmations, etc.) must go above this block; everything else may go below.
    if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
        source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
    fi
fi

# ===== Plugins ================================================================

source "$HOME/.zsh/miniplug.zsh"
export MINIPLUG_HOME="$HOME/.zsh/plugins"
miniplug plugin 'MenkeTechnologies/zsh-more-completions'
miniplug plugin 'hlissner/zsh-autopair'
miniplug plugin 'agkozak/zsh-z'
miniplug plugin 'qoomon/zsh-lazyload'
miniplug plugin 'randomphrase/vterm-zsh-plugin'
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


# ===== Shell Behaviour =========================================================

# --- Shell Changes

## - zsh apple touchbar
if ! [[ -v INSIDE_EMACS ]]; then
  source ~/.zsh/zsh-apple-touchbar/zsh-apple-touchbar.zsh
fi

## - Powerline 10k
source ~/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- Terminal Emulator Specific
set -o vi
## - iTerm shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# --- Setting up Executables

## Conda
setup_conda() {
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/Users/philliporeggio/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/Users/philliporeggio/opt/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/Users/philliporeggio/opt/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/Users/philliporeggio/opt/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
# <<< conda initialize <<<
}
lazyload conda -- 'setup_conda'


autoload -U compinit && compinit -u

## - opam config
setup_opam() {
  test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
}
lazyload opam -- 'setup_opam'

# --- Exported Variables
export EDITOR="vim"
export BAT_THEME="cornell"

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

# --- Alias
## General
alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias sl="ls"

## Mac OS
alias qutebrowser="/Applications/qutebrowser.app/Contents/MacOS/qutebrowser"

# Node Version Master
setup_nvm() {
  export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}
lazyload nvm -- 'setup_nvm'
lazyload npm -- 'setup_nvm'

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
## Commands
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"
## Xcode/iOS
alias xcode='open -a Xcode'
alias xvi='open -a XVim'
alias delete_pods='rm -f Podfile.lock && rm -rf Pods'
## Python
alias venv='source venv/bin/activate' # activate venv
alias initvenv='python3 -m venv ./venv' # create venv with no site packages
alias python3='/usr/local/bin/python3'
alias pip3_8="$HOME/Library/Python/3.8/bin/pip"

## Web Browsers
alias chrome='open -a "Google Chrome 2"'
alias safari='open -a "Safari"'
alias incognito='~/bin_scripts/open_incognito_safari'
## Mail
alias gmail_personal='open -a /Applications/Google\ Chrome\ 2.app '\''https://mail.google.com/mail/u/0/#inbox'\'''
alias gmail_cornell='open -a Safari '\''https://mail.google.com/mail/u/0/#inbox'\'''
## AMPL
alias ampl='~/bin_scripts/ampl_msg.sh'
## Emacs
alias fix_ispell='~/bin_scripts/emacs-fix/fix_ispell.bash'
alias emacs-fix='~/bin_scripts/emacs-fix/emacs-fix'
alias ec='emacsclient'
## IntelliJ
alias intellij='~/bin_scripts/intellij.sh "$(pwd)"'
## LEETCODE
alias leett='leetcode test'
alias leetget='~/bin_scripts/leetget.sh'
## Dotfiles repo
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias dots='dot status'
alias dotc='dot commit -m'
alias dotchanged='$HOME/bin_scripts/dotchanged.sh'

# --- PATH
## - the bins
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

## - executables on path
# Vim
export PATH="$HOME/.vimpkg/bin$PATH"
## Emacs
export PATH="$HOME/.emacs.d/bin:$PATH"

# MacOS
## - Programming Langs
# Rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
export DYLD_LIBRARY_PATH="$(rustc --print sysroot)/lib:$DYLD_LIBRARY_PATH"
# node
export PATH="/usr/local/opt/node@8/bin:$PATH"
# Python
# ~ user path
export PATH="$HOME/Library/Python/3.8/bin:$PATH"
# go
export PATH="/usr/local/go/bin:$PATH"
# LaTex
export PATH="/usr/texbin:/usr/texbin:$PATH"
path+=('/Library/TeX/texbin/')

# Scala
export PATH="$PATH:$HOME/Library/Application Support/Coursier/bin"
# Swift
export PATH="$HOME/bin_scripts/SourceKittenDaemon/dist/bin/sourcekittendaemon:$PATH"

# - Personal
# Custom bins/scripts
export PATH="$HOME/bin_scripts/bin:$PATH"

# Aws
export PATH="/Users/philliporeggio/.ebcli-virtual-env/executables:$PATH"
