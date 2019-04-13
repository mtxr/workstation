unalias rf  &>/dev/null
unalias rm  &>/dev/null
unalias cp  &>/dev/null
unalias mv  &>/dev/null
unalias grc &>/dev/null

alias count="wc -l"

# Use colors in coreutils utilities output
alias ls='ls -G --color=auto'
alias grep='grep --color'
alias cat='bat'

# ls aliases
alias ll='ls -lah'
alias la='ls -A'
alias l='ls'
alias k='k -ha' # zsh plugin K for git repositories

# Aliases to protect against overwriting
alias rm='rm --interactive=once -I'

# general aliases
alias diff='colordiff'
alias fuck='sudo $(fc -ln -1)'
alias grep='grep --color=always'
alias mtr='grc mtr'
alias netstat='grc netstat'
alias ping='grc ping'
alias ps='grc ps aux'
alias pyserver='python -m SimpleHTTPServer'
alias phpserver='php -S 0.0.0.0:8000'
alias rzsh='source ~/.zshrc'
alias tail='grc tail'
alias tailf='tail -f'
alias traceroute='grc traceroute'
alias updsys='(type apt-get &> /dev/null && sudo apt-get update) || (type brew &> /dev/null && dnf check-update)'
alias upgsys='(type apt-get &> /dev/null && sudo apt-get upgrade) || (type brew &> /dev/null && dnf upgrade)'
alias upsys='updsys && upgsys'
alias xcp='xclip -sel clip'
alias yolo=fuck
alias zshconfig='vim ~/.zshrc'
alias chownme='chown -R $(id -u):$(id -g)'
alias tls='tmux list-sessions'

# Mirror a website
alias mirrorsite='wget -m -k -K -E -e robots=off'

# Git Aliases
alias gb='git branch'
alias gcb='git rev-parse --abbrev-ref HEAD' # current branch
alias gco='git checkout'
alias gnb='git checkout -b'
alias gcof='gco $(git rev-list --all | rg $(git rev-parse HEAD) -B1 | head -n 1)'
alias gcop='gco $(git rev-list --all | rg $(git rev-parse HEAD) -A1 | tail -n 1)'
alias gch='gco HEAD'
alias gst='git status -s'
alias gdf='git diff'
alias gpl='git pull'
alias gps='git push'
alias gmine='git log --author="$(git config --get user.name)" --grep="^[a-zA-Z0-9]{7} ((?![mM]erge).*)$" --perl-regexp'
alias gbm='git branch --merged | rg "$GIT_CLEAR_BRANCH_EXCLUDE" -v | rg -v "`gcb`"'
alias gbcls='gbm && (gbm | xargs git branch -d) || echo "Nothing to remove"'
alias gsl='git stash list'
alias gsa='git stash'
alias gsp='git stash pop'

# ------------------------------------
# Docker alias
# ------------------------------------

# Get latest container ID
alias dl="docker ps -l -q"

# Get container process
alias dps="docker ps"

# Get process included stop container
alias dpa="docker ps -a"

# Get images
alias di="docker images"

# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"

# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"

# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"

alias dls='docker ps --format "table  {{.Names}}\t{{.Status}}\t{{.Ports}}"'

alias rlink='python -c "import os,sys;print(os.path.realpath(sys.argv[1]))"'

alias wrl='source $HOME/.zshrc'
alias wscd='cd $DOTFILES'


# utilities
alias todos="rg -e '(//|#|<!--|;)\s*(TODO|FIXME)'"
alias hosts="cat /etc/hosts"
alias ehosts="sudo vi /etc/hosts"

tns() {
  local name="$1"
  local dir="$2"

  if [ "$name" = "" ];then
    tmux new
    return 0
  fi

  if [ "$dir" = "" ];then
    tmux attach -t $name || tmux new -s $name
    return 0
  fi

  tmux attach -t $name || tmux new -s $name -c "$2"
}