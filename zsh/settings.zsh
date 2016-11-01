# Initialize completion
autoload -Uz compinit && compinit -i
zstyle ':completion:*' menu select=20

# Initialize editing command line
autoload -U edit-command-line && zle -N edit-command-line

# Set automatic cd (typing directory name with no 'cd')
setopt autocd

# Enable interactive comments (# on the command line)
setopt interactivecomments

# Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt incappendhistory
setopt extendedhistory

# Time to wait for additional characters in a sequence
KEYTIMEOUT=1 # corresponds to 10ms
