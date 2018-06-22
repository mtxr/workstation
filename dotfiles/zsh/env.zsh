export TERM="xterm-256color"
export EDITOR=vim
export VISUAL=$EDITOR
export PAGER=less
export LESS='-F -g -i -M -R -S -w -X -z-4'
export WORDCHARS=''
export PROJECTS=$HOME/projects
export GOPATH=$PROJECTS/go
export WORKSTATION=$HOME/.workstation
export N_PREFIX=${N_PREFIX:-"$HOME/.n"}
export PATH="$WORKSTATION/bin:$N_PREFIX/bin:/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$HOME/bin:/snap/bin:/usr/local/sbin:$PATH"
export GIT_CLEAR_BRANCH_EXCLUDE="release|develop|master"
export fpath=( $HOME/.autoload-zsh $fpath )
export VSCODE_FILE=$HOME/.vscode-cli
export GPG_TTY=$(tty)
