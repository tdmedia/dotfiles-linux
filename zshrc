# Explicitly configured $PATH variable
PATH=/usr/local/php5/bin:/usr/bin/tmuxifier/bin/tmuxifier:/bin:/usr/local/git/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/local/bin:/opt/local/sbin:/usr/X11/bin
export PATH

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="milomedia"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Put any proprietary or private functions/values in ~/.private, and this will source them
if [ -f $HOME/.private ]; then
    source $HOME/.private
fi

if [ -f $HOME/.profile ]; then
    source $HOME/.profile  # Read Mac .profile, if present.
fi

# Shell Aliases
## Git Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gp='git push '
alias gpo='git push origin master'
alias gk='gitk --all&'
alias gl='git pull '
alias glo='git pull origin master'
alias gx='gitx --all'
alias got='git '
alias get='git '
## Symfony aliases
alias appcl='app/console cache:clear'
alias appc='app/console '
alias cap='nocorrect cap'
## tmuxifier is really hard to type
alias tmuxi='nocorrect tmuxifier '


# qfind - used to quickly find files that contain a string in a directory
qfind () {
    find . -exec grep -l $1 {} \;
    return 0
}

# Custom exports
## Set EDITOR to /usr/bin/vim if Vim is installed
if [ -f /usr/bin/vim ]; then
    export EDITOR=/usr/bin/vim
fi

# tmux session saver
#export PATH="~/.tmuxifier/bin:$PATH"
eval "$(/usr/bin/tmuxifier/bin/tmuxifier init -)"

case $TERM in
        xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac
