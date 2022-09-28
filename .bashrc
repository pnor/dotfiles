alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

case $(uname) in
    "Linux" )
        # if [[ "$TERM" == "linux" ]]; then
        #     source $HOME/.cache/wal/colors.sh
        # fi
    ;;
    "Darwin")
        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
        export PATH="/usr/local/opt/node@8/bin:/anaconda3/bin:/anaconda3/condabin:/Library/Frameworks/Python.framework/Versions/3.6/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/texbin:/usr/texbin:$HOME/.vimpkg/bin:$HOME/go/bin:$PATH"
    ;;
    *)
    ;;
esac
