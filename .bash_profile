# =============================================================================
# BASH PROFILE
# =============================================================================

# Use 256 color if possible
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

## Get and parse git branch for use in prompt
get_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
}

# Prompt - username, directory basename, git branch if exists, newline
export PS1="\e[0;37m\u \e[0;32m\W\e[0m\$(get_git_branch) \n$ "

# Let other programs use ctrl-s and ctrl-q (useful for Vim)
stty -ixon

# History
export HISTSIZE=32768
export HISTFILESIZE=$HISTSIZE
export HISTCONTROL=ignoredups
export HISTCONTROL=ignoreboth

# =============================================================================
# ALIASES
# =============================================================================
alias reload="clear; source ~/.bash_profile"

# Extend commands
alias ls='ls -FG'
alias ll='ls -FGlAhp'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# find file
alias qfind='find . -name '

# file count
alias filecount='find . -print | wc -l'

# display $PATH in lines
alias paths='echo $PATH | tr ":" "\n"'

# display disk usage for frequently backed-up directories
alias backupsize='du -hsc ~/Downloads ~/Pictures ~/Documents ~/Music ~/Movies ~/Dev'

# nuke .DS_Store
alias nukeDS='find . -type f -name "*.DS_Store" -ls -delete'

# Hide/show all desktop icons
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# Hide or show hidden files in Finder and on Desktop
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pgstop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'

alias server='python -m SimpleHTTPServer'
alias phpserver='php -S localhost:8000 system/router.php'
# =============================================================================
# GIT ALIASES
# =============================================================================
alias g='git status'
alias ga='git add'
alias gco='git commit'
alias gchk='git checkout '
alias gb='git branch'
# git diff working tree
alias gd='git diff'
# git diff last commit
alias gdl='git diff @^'
# minimal git log
alias gl='git log --graph --oneline'
# minimal git log expanded with date and author
alias glx='git log --pretty=format:"%C(yellow)%h\\ %ad%Cred%d\\ %Creset%s%Cblue\\ [%cn]" --decorate --date=short --graph'
# fetching from origin
alias gf='git fetch origin'
# pushing to origin <some branch>
alias gpo='git push origin'
# git shortcuts for weekends
alias gpull='git pull origin master'
alias gpom='git push origin master'
alias ga.='git add .'
alias gall='git add -A && git commit -m'
# add hunks
alias gap='git add -p'
# stashing
alias gstl='git stash list'
alias gsta='git stash apply'

# =============================================================================
# PATH, etc.
# =============================================================================
export PATH=$PATH:~/.local/bin
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
eval "$(rbenv init -)"

eval "$(pyenv init -)"
# added by Anaconda3 5.3.0 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
