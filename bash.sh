# Aliases
# =====================

# postgres
# alias pgstart="postgres -D /usr/local/var/postgres"
source ~/git-completion.bash

# Git
alias ga.="git add ."
alias gb="git branch -a"
alias gcl="git clone"
alias gca="git commit --amend"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcom="git checkout master"
alias gd="git diff"
alias gfa="git fetch --all"
alias gp="git push"
alias gst="git status"


# Quick Navigation
alias code="clear; cd ~/Code/; ls"
alias dev="clear; cd ~/Dropbox/Dev; ls"
alias boost="cd ~/Code/boost; rbenv shell 1.9.3-p551"
alias fbaa="cd ~/Code/facebook-ads-adapter; rbenv shell 1.9.3-p551"
alias oiaa="cd ~/Code/opt-intelligence-ads-adapter; rbenv shell 2.2.2"
alias nom="cd ~/Dropbox/Dev/nomster; rbenv shell 2.2.1"

# Other
alias sel="DRIVER=selenium"
alias be="bundle exec"
alias editbash="subl ~/.bash_profile"
alias reload="source ~/.bash_profile"

## PROMPT FORMATTING
# ===================
 
function git_branch {
  git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/ (\1)/"
}
 
function ruby_version {
  rbenv version | sed -e "s/ .*//"
}
 
function prompt {
  # Reset
  local Default="\e[0m"       # Text Reset

  # Text
  local Black="\e[0;30m"        # Black
  local Red="\e[0;31m"          # Red
  local Green="\e[0;32m"        # Green
  local Yellow="\e[0;33m"       # Yellow
  local Blue="\e[0;34m"         # Blue
  local Purple="\e[0;35m"       # Purple
  local Cyan="\e[0;36m"         # Cyan
  local White="\e[0;37m"        # White

  # Background
  local On_Black="\e[40m"       # Black Background
  local On_Red="\e[41m"         # Red Background
  local On_Green="\e[42m"       # Green Background
  local On_Yellow="\e[43m"      # Yellow Background
  local On_Blue="\e[44m"        # Blue Background
  local On_Purple="\e[45m"      # Purple Background
  local On_Cyan="\e[46m"        # Cyan Background
  local On_White="\e[47m"       # White Background

  local        CHAR="🐓 "

  export PS1="$Black$On_Cyan\t$Default \$(ruby_version)\$(git_branch) $Green\W$Default\n$CHAR "

}

# Finally call the function
prompt
 
# ENVIRONMENT VARIABLES
# ===================== 
  # Configurations
    export JAVA_HOME=$(/usr/libexec/java_home)
    export JRUBY_OPTS="-J-Xmx1g --1.9"
    export JAVA_OPTS="-XX:MaxPermSize=512m -Xms1024m -Xmx2048m -Dfile.encoding=UTF-8 -Djruby.jit.threshold=50 -Djruby.compile.mode=JIT -Djava.awt.headless=true -server -Djruby.compile.invokedynamic=false"
 
    # GIT_MERGE_AUTO_EDIT
    # This variable configures git to not require a message when you merge.
    export GIT_MERGE_AUTOEDIT="no"
 
    # Editors
    # Tells your shell that when a program requires various editors, use sublime.
    # The -w flag tells your shell to wait until sublime exits
    export VISUAL="subl -w"
    export SVN_EDITOR="subl -w"
    export GIT_EDITOR="subl -w"
    export EDITOR="subl -w"
 
  # Paths
    # export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"
    export HEROKU="/usr/local/heroku/bin"
    export PYTHON="/usr/local/share/python"
    export USR_PATHS="/usr/local:/usr/local/bin:/usr/local/sbin:/usr/bin:/Users/Nate/bin"
    export PATH="$USR_PATHS:$PYTHON:$HEROKU:$PATH"

# Final Configurations and Plugins
# =====================

# Bash autocompletion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Git Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"

# SSL Cert Fix
export SSL_CERT_FILE=/usr/local/etc/openssl/cert.pem

# load rbenv automatically
eval "$(rbenv init -)"
