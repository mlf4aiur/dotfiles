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
# alias pp='python -mjson.tool | pygmentize -l javascript'
# alias pp_xml='python ~/Tools/pp_xml.py | pygmentize -l xml'
alias pp='python -mjson.tool | lolcat'
# alias pp='python -mjson.tool | pygmentize -l js'
alias pp_xml='python ~/Tools/pp_xml.py'
alias cgiserver="ifconfig | grep --color -o 'inet 1[079][^ ]*'; python -m CGIHTTPServer 8000" # cgi_directories ['/cgi-bin', '/htbin']
# alias webshare='share () { port=$1; ifconfig | grep --color -o "inet 1[079][^ ]*"; python -m SimpleHTTPServer ${port:-8000};}; share'
alias webshare='share () { port=$1; ifconfig | grep --color -o "inet 1[079][^ ]*"; twistd -n web --port ${port:-8000} --path .;}; share'
alias Daemon='cd ~/Documents/workspace/Daemon/'
alias OpenSource='cd ~/Documents/workspace/OpenSource/'
alias Github='cd ~/Documents/workspace/Github/'

title () { title=$@; echo -n -e "\033]0;${title}\007"; }
genpw () { openssl rand -base64 ${@:-9}; }
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

git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  echo "{${git_branch}} "
}

export LSCOLORS=ExGxCxDxCxEgEdAbAgAcAd
# export PS1='[\u@\h \W]\$ '
export PS1='[$(git_prompt)\u@\h \W]$ '
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

shopt -s histappend
PROMPT_COMMAND="history -a; "
HISTTIMEFORMAT="%F %T "
HISTSIZE=2000
export HISTTIMEFORMAT

# boot2docker
# Writing ~/.boot2docker/certs/boot2docker-vm/ca.pem
# Writing ~/.boot2docker/certs/boot2docker-vm/cert.pem
# Writing ~/.boot2docker/certs/boot2docker-vm/key.pem

# To connect the Docker client to the Docker daemon, please set:
export DOCKER_CERT_PATH=/Users/mlf4aiur/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
# [[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"
[[ -s "$HOME/Tools/private_profile" ]] && source "$HOME/Tools/private_profile"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
source /usr/local/bin/activate.sh
