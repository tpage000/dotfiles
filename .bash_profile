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

# Extend commands with more detail
alias ls='ls -F'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias mkdir='mkdir -pv'

# git shortcuts (fine to use these for status and pulling)
alias gs='git status'
alias gpull='git pull origin master'
# git shortcuts (bad practice, PROHIBITED, only for messing around)
alias gpom='git push origin master'
alias gall='git add -A && git commit -m'
# git shortcuts (For rapid throwaways, emergencies, dumpster fires)
alias gupdates='git add -A && git status && git commit -m "updates" && git status'

# Hide/show all desktop icons
alias hide_desktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias show_desktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
# Hide or show hidden files in Finder and on Desktop
alias hide_files="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias show_files="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"

# =============================================================================
# PATH
# =============================================================================
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

