alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls -G'
alias ll='ls -lG'
alias grep='grep --color'
alias vi='/usr/local/bin/vim'
alias zcat='gzip -dc'
alias subl="'/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl'"
alias tree='ls -R | grep ":$" | sed -e "s/:$//" -e "s/[^-][^\/]*\//--/g" -e "s/^/   /" -e "s/-/|/"'
alias pp='python -mjson.tool | pygmentize -l javascript'
alias cgiserver="ifconfig | grep --color -o 'inet 1[079][^ ]*'; python -m CGIHTTPServer 8000" # cgi_directories ['/cgi-bin', '/htbin']
alias webshare='share () { port=$1; ifconfig | grep --color -o "inet 1[079][^ ]*"; python -m SimpleHTTPServer ${port:-8000} ;}; share'
alias Daemon='cd ~/Documents/workspace/Daemon/'
alias OpenSource='cd ~/Documents/workspace/OpenSource/'
alias Github='cd ~/Documents/workspace/Github/'

title () { title=$@; echo -n -e "\033]0;${title}\007"; }
tea_ready () {
    timer=${1:-180}
    repeat=${2:-3}
    sleep $timer
    for ((a=1; a<=repeat; a++))
    do
        sleep 3
        say "tea ready"
    done
}

export LSCOLORS=ExGxCxDxCxEgEdAbAgAcAd
export PS1='[\u@\h \W]\$ '
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

shopt -s histappend
PROMPT_COMMAND="history -a; "
HISTTIMEFORMAT="%F %T "
HISTSIZE=2000
export HISTTIMEFORMAT

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# [[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"
[[ -s "$HOME/Tools/private_profile" ]] && source "$HOME/Tools/private_profile"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
