# Because .bash_profile has precedence over .bashrc in Apple computers,
# this file is necessary to guard against creating a .bash_profile and
# accidentally overrideing all of the configuration in .bashrc
#
# All it should do is load .bashrc ###
source "$HOME/.bashrc" 
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

set -o vi
bind '"jk":vi-movement-mode'

alias gcm='git commit -m'
alias gaa='git add -A'
alias gam='git add -A && git commit -m'
alias gaml='git add -A && git commit'

alias gco='git checkout'
__git_complete gco _git_checkout

alias gs='git status'
alias gb='git branch'
__git_complete gb _git_branch

alias gd='git diff'
alias gdm='git diff master'

alias gdc='git diff --cached'
alias gpo='git push -u origin master'
alias gpc='gb | grep \* | cut -d " " -f 2 | xargs git push -u origin'
alias gp='git push'
alias pull='git pull'
alias gpr='git pull --rebase'
alias grh='git reset --hard'
alias gl='git log'
alias glo='git log --oneline'
alias glp='git log -p';
alias gds='git diff --staged'
alias gi='git init'
alias gclean='git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d'
alias mergem='git merge master -m "merge master"'
alias master='git checkout master && git pull'
alias clone="git clone"
alias be='bundle exec'
alias ber='bundle exec rspec'
alias bi='bundle install'
alias ..='cd ..'
alias a.='atom .'
alias sub.='sublime .'
alias dk='cd ~/Desktop'
alias rc='rails c'
alias rdbc='rake db:create'
alias rdbd='rake db:drop'
alias rdbm='rake db:migrate'
alias rdbr='rake db:reset'
alias rdbs='rake db:seed'
alias rr='bundle exec rake routes'
alias cgrn='create-github-repo --name'

alias chrome="open -a 'Google Chrome'"
alias mvi="open -a MacVim.app $1"

alias nv='nvim'

alias ns='npm start'
alias ni='npm install'
alias nis='npm install --save'

alias grep="grep --color='auto'"
alias prettyjson="python -m json.tool"

alias pst="ps f -eo pid,ppid,%cpu,%mem,bsdtime,user,cmd"

alias maketags='ctags -R /home/ubuntu/matroid'

export PS1="\[\033[32m\]\u\[\033[33m\]@\[\033[36m\]john-gcp:\[\033[35;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'

alias myip='curl ipecho.net/plain ; echo'

# show hidden files
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'

# hide hidden files
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'


alias coverage='yarn run coverage-report'

alias rs='sudo service nginx stop && cd /home/ubuntu/matroid; /home/ubuntu/matroid/restart.sh'
alias frs='cd /home/ubuntu/matroid; docker-compose down && docker-compose up -d'
alias drs='docker-compose down && docker-compose up -d'
alias brs='cd /home/ubuntu/matroid; /home/ubuntu/matroid/restart_master.sh && /home/ubuntu/matroid/restart_slave.sh'
alias tc='docker exec matroid_matroid-frontend_1 npm run test-controller'
alias tu="sudo ln -fsn ../ 'node_modules/>' && sudo yarn test-ui"

alias tcoi='tco test/controller/index_test.js'
alias tm='docker exec matroid_matroid-frontend_1 yarn run test-models'

alias tra='yarn run test-restful-api'
alias trao='yarn run test-restful-api-one'

alias mom='mongo matroid'
alias lnh='less nohup.out'
alias dlf='docker logs -f matroid_matroid-frontend_1'
alias dlw='docker logs -f matroid-webpack'
alias dlm='docker logs -f matroid-master'
alias dmm='docker exec -it matroid-mongo bash'
alias dfe='docker exec -it matroid_matroid-frontend_1 bash'
alias grep="grep --color='auto'"

alias attach="tmux -CC attach"

alias pods="kc get pods"
alias services="kc get services"
alias deployments="kc get deployments"

alias esm="kc exec -it $(kc get pods | ag mongo | awk '{print $1}') bash"
alias epm="kcp exec -it $(kcp get pods | ag mongo | awk '{print $1}') bash"

alias kcp='kubectl --context prod2.www.matroid.com'
alias kcs='kubectl --context staging5.dev.matroid.com'
alias ppods="kubectl --context prod2.www.matroid.com get pods"
alias pservices="kubectl --context prod2.www.matroid.com get services"
alias pdeployments="kubectl --context prod2.www.matroid.com get deployments"

alias wkc='watch -n 1 kubectl --context staging5.dev.matroid.com get pods'
alias wkcp='watch -n 1 kubectl --context prod2.www.matroid.com get pods'
alias wkck='watch -n 1 kubectl --namespace=kube-system --context staging5.dev.matroid.com get pods'
alias wkcpk='watch -n 1 kubectl --namespace=kube-system --context prod2.www.matroid.com get pods'

alias containers="docker container ls"
alias dps="docker ps"
alias dc="docker-compose"

alias prom="kc --namespace monitoring port-forward svc/grafana 8000:3000"
alias promp="kcp --namespace monitoring port-forward svc/grafana 8000:3000"

# ssh to Matroid machine
alias lnh='less nohup.out'

alias dpfe="cd /home/ubuntu/matroid/k8s && sudo make -f Makefile.staging frontend push_frontend update_frontend"

alias sbp="source ~/.bash_profile"

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

#Matroid integration tests
alias testja='~/matroid/test/integration/run_selenium.sh https://john.devaz.matroid.com john@thematroid.com password 1 2'
alias teststaging='~/matroid/test/integration/run_selenium.sh https://staging.dev.matroid.com john@thematroid.com password 1 2'

# added by Anaconda3 4.3.0 installer
export PATH="//anaconda/bin:$PATH"
PATH=/opt/local/bin:$PATH

export MATROID_CLIENT_ID=6pVYjgcXAkdQaOzC
export MATROID_CLIENT_SECRET=3h9D5keuMmhbOenb5Ji5SwZyw4xDRBCR

alias ml='/home/ubuntu/kubetail'

sel() {
  cd ~/matroid/k8s && make -f Makefile.staging circleci_selenium PR_ID="$1"; cd ~/matroid
}

sel_one() {
  cd ~/matroid/k8s && make -f Makefile.staging TEST_NAME="$1"  PR_ID="$2" circleci_selenium_run_one; cd ~/matroid
}

selj() {
  cd ~/matroid/k8s && make -f Makefile.staging circleci_selenium PR_ID="$1" SELENIUM_URL=https://john.devaz.matroid.com; cd ~/matroid
}

# Bash function to create a video stream that shows a stimestamp
timestampstream() {
  nohup ffmpeg -f rawvideo -re -r 25 -pix_fmt yuv420p -video_size 1920x1080 -i /dev/zero \
  -vf "drawtext=text='%{gmtime\:%T} - %{gmtime\:%s} - %{pts}': fontcolor=white: box=1: boxcolor=black: x=10: y=10: fontsize=50" \
  -f flv -c:v h264 -c:a aac rtmp://john.devaz.matroid.com/live/"$1" &
}

# Bash function to download production frontend logs from a given day
prodlog() {
  cd ~/matroid/k8s && make -f Makefile.prod download_logs LOG_DATE="$1" LOG_TAG=frontend
}

# Bash function to download staging frontend logs from a given day
staginglog() {
  cd ~/matroid/k8s && make -f Makefile.staging download_logs LOG_DATE="$1" LOG_TAG=frontend
}

dlog() {
  less ~/task_logs/cpu/task-"$1".log
}

tco() {
  docker exec matroid_matroid-frontend_1 npm run test-controller-one "$1"
}

rswps() {
  pid=$(ps aux | ag webpack | ag node | awk '{ print $2 }')

  if [ -z "$pid" ]; then
    echo "No webpack process running"
  else
    echo "kill $pid"
    sudo kill $pid
  fi

  sudo yarn run dev-server &
}

kwps() {
  pid=$(ps aux | ag webpack | ag node | awk '{ print $2 }')

  if [ -z "$pid" ]; then
    echo "No webpack process running"
  else
    echo "kill $pid"
    sudo kill $pid
  fi
}

fmtlog () 
{ 
    cat "$1" | python3 ~/matroid/k8s/utils/fmtlog.py > "$1.clean";
    echo "Generated logfile at $1.clean"
}

mlprod () {
  /home/ubuntu/kubetail "$1" --context prod2.www.matroid.com
}

# Get the weather
# Example usage: 
# 
# weather "Palo Alto"
#
function weather() { 
  location=$1

  if [ -z "$location" ]; then
    location="Palo Alto"
  fi

  curl -s "wttr.in/$location"
}

# Set a timer for n seconds
# Example usage: 
# 
# timer 10
#
function timer() {
  total=$1
  for ((i=total; i>0; i--)); do sleep 1; printf "Time remaining $i secs \r"; done
  echo -e "\a"
}

# cd up n times. 
# Example usage: 
# 
# up 3
#
function up() {
  times=$1
  while [ "$times" -gt "0" ]; do
    cd ..
    times=$(($times - 1))
  done
}

# Extract any compressed file type
function extract () {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.tar.xz)    tar Jxvf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       rar x $1       ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip -d `echo $1 | sed 's/\(.*\)\.zip/\1/'` $1;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)           echo "don't know how to extract '$1'" ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}

# download staging logs
kcdl(){
  if [ "$#" -eq 0 ]; then
    echo "Usage: kcdl TagToSearchFor [date(e.g. 2019/12/12)]";
    return 1;
  fi;
  if [ "$#" -eq 1]; then
    pushd ~/matroid/k8s/
    make -f Makefile.staging download_logs LOG_TAG=$1
    popd
  else
    pushd ~/matroid/k8s/
    make -f Makefile.staging download_logs LOG_TAG=$1 LOG_DATE=$2
    popd
  fi;
}

# download prod logs
kcpdl(){
  if [ "$#" -eq 0 ]; then
    echo "Usage: kcpdl TagToSearchFor [date(e.g. 2019/12/12)]";
    return 1;
  fi;
  if [ "$#" -eq 1]; then
    pushd ~/matroid/k8s/
    make -f Makefile.prod download_logs LOG_TAG=$1
    popd
  else
    pushd ~/matroid/k8s/
    make -f Makefile.prod download_logs LOG_TAG=$1 LOG_DATE=$2
    popd
  fi;
}

# clean logs
# fmtlog ()
# {
#     if [ "$#" -eq 0 ]; then
#         echo "Usage: fmtlog /path/to/logfile";
#         return 1;
#     fi;
#     for f in "$@";
#     do
#         if [ -f "$f" ]; then
#             cat "$f" | python3 -c "
# import sys
# for line in sys.stdin:
#   line = eval(line)
#   print(line['message'] if 'message' in line else line['log'])
# " > "$f.clean";
#             echo "Generated logfile at $f.clean";
#         fi;
#     done
# }

findreplace() 
{
  if [ "$#" -ne 3 ]; then
      echo "Usage: findreplace termToReplace replacingTerm directory";
      return 1;
  fi;

  find $3 -path ./node_modules -prune -o -type f -exec sed -i -e "s/$1/$2/g" {} \;
}

cd ~/matroid

# ls colors
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh --color=auto'

export TERM=xterm-256color


export CREDITS_API_KEY=your_credit_key
export FEED_DETECTION_KEY=your_feed_key

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"

export PATH=$PATH:/snap/bin/
export PATH=$PATH:/home/ubuntu/.local/bin

export SUBNET=172.27.0.0/24
