#
# Set a long enough history.
#

HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000

#
# Emacs keybindings.
#

bindkey -e

#
# Initialise the completion system.
#

zstyle :compinstall filename '/home/luke/.zshrc'
autoload -Uz compinit
compinit

#
# Swapt to Bash style word separators.
#

autoload -U select-word-style
select-word-style bash

#
# Syntax highlighting.
#

ZSH_HIGHLIGHT_FILE=/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if [ -f $ZSH_HIGHLIGHT_FILE ]; then
    source $ZSH_HIGHLIGHT_FILE
fi
if [ -f $HOME/.dir_colors/dircolors ]; then
    eval `dircolors $HOME/.dir_colors/dircolors`
fi
alias ls='ls --color=auto'

#
# Powerlevel9k configuration.
#

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir virtualenv vcs)
POWERLEVEL9K_OS_ICON_FOREGROUND='255'
POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='255'
POWERLEVEL9K_VIRTUALENV_BACKGROUND='red'
POWERLEVEL9K_VIRTUALENV_FOREGROUND='white'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

#
# NPM configuration.
#

export PATH=$HOME/.node_modules/bin:$PATH
export npm_config_prefix=~/.node_modules

#
# PyEnv
#

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)" &> /dev/null
eval "$(pyenv virtualenv-init -)" &> /dev/null

#
# Miscellaneous.
#

export EDITOR='emacs -nw'

eval "$(direnv hook zsh)"

eval "$(ssh-agent -s)" &> /dev/null

export PATH=$HOME/.local/bin:$PATH

function e {
    emacs -nw $1
}

function o {
    xdg-open $1
}

alias c="xclip -selection clipboard"

CURRENT_UID=$(id -u):$(id -g)

function findlatest {
    find $1 -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort -nr | cut -d: -f2- | head
}

# nohup $HOME/.shell/kill-gjs.sh > /dev/null 2>&1 &
