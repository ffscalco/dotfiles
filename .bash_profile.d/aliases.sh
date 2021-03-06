# Easier navigation: .., ..., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~" # `cd` is probably faster to type though
alias -- -="cd -"
alias vv='cd ..; cd -'

# Shortcuts
alias d="cd ~/Dropbox"
alias p="cd ~/projetos"
alias g="git"
alias m="mate ."
alias s="subl ."
alias o="open"
alias oo="open ."

# Always use color output for `ls`
if [[ "$OSTYPE" =~ ^darwin ]]; then
  alias ls="command ls -GF"
else
  alias ls="command ls -F --color"
  export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'
fi
# List all files colorized in long format
alias l="ls -GlAh"
alias ll="ls -Glh"
# List all files colorized, including dot files
alias la="ls -GA"
# List only directories
alias lsd='ls -l | grep "^d"'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Get OS X Software Updates, update Homebrew itself, and upgrade installed Homebrew packages
alias update_all='sudo softwareupdate -i -a; brew update; brew upgrade'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# OS X has no `md5sum`, so use `md5` as a fallback
type -t md5sum > /dev/null || alias md5sum="md5"

# Recursively delete `.DS_Store` files
alias cleanup_dstores="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
# Also, clear Apple’s System Logs to improve shell startup speed
alias emptytrashs="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# # Show/hide hidden files in Finder
# alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
# alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Disable Spotlight
alias spotligh_off="sudo mdutil -a -i off"
# Enable Spotlight
alias spotligh_on="sudo mdutil -a -i on"

# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 7'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

# servers (homebrew)
alias start_postgres='postgres -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stop_postgres='postgres -D /usr/local/var/postgres stop -s -m fast'
alias start_mongodb='mongod run --config /usr/local/etc/mongod.conf'
alias start_memcached='/usr/local/opt/memcached/bin/memcached -v'
alias start_mysql='mysql.server start'
alias stop_mysql='mysql.server stop'
alias start_redis='redis-server /usr/local/etc/redis.conf'
alias start_elasticsearch='elasticsearch -f -D es.config=/usr/local/opt/elasticsearch/config/elasticsearch.yml'

# git
alias gl='git pull'
alias gp='git push'
alias gd='git diff'
alias ga='git add '
alias gc='git commit'
alias gca='git commit -a'
alias go='git checkout '
alias gco='git checkout'
alias gb='git branch'
alias gba='git branch -a'
alias gs='git status'
alias gx='gitx --all'
alias gitx='open -a /Applications/GitX.app .'
alias gpom='git push origin master'
alias glo='git pull origin'
alias glom='git pull origin master'
alias grpo='git remote prune origin'
alias got='git '
alias get='git '
alias gbspecs="git list-branch-diffed-files | egrep --color=never '_(spec|test).rb'"
alias gg='git grep --break --heading --line-number --color'

# rails
alias integrate="unset_perf_vars && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true time memusg bundle exec rake integrate && set_perf_vars && say 'integration finished'"
alias integrate_lowmem="unset_perf_vars && bundle exec rake db:migrate db:test:prepare && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true bundle exec rspec spec/helpers/* spec/routing/* spec/lib/* spec/mailers/* spec/workers/* && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true bundle exec rspec spec/models/* && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true bundle exec rspec spec/controllers/* && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true bundle exec rake spec:javascript && RAILS_ENV=test IGNORE_GC_PERFORMANCE_FILE=true bundle exec rspec features/*_spec.rb && set_perf_vars && say 'integration finished'"
alias tlog='tail -f log/development.log'
alias rs='script/rails server'
alias rc='script/rails console'
alias rg='script/rails generate'
alias fs='foreman start -f Procfile.development'
alias fsb='foreman start -f Procfile.benchmark'
alias fr='foreman run '
alias bex='bundle exec '
alias frbex='foreman run bundle exec '
alias branchspec="bundle exec rspec $(git diff --diff-filter=ACMRTUXB --name-only master -- spec test | egrep --color=never '_(spec|test).rb' | sed 's/src\///')"

alias growl="growlnotify"
alias psgrep="ps aux | egrep -v egrep | egrep"

# mac os x apps
alias mou='open -a Mou' # opens a existing file in Mou.app via "mou filename.md"

# vagrant
alias v='vagrant status'
alias vs='vagrant ssh'
alias vu='vagrant up'
alias vup='vagrant up --provision'
alias vup-vmware='vagrant up --provision --provider=vmware_fusion'
alias vup-virtualbox='vagrant up --provision --provider=virtualbox'
alias vh='vagrant halt'
alias vd='vagrant destroy'
alias vp='vagrant provision'
alias vr='vagrant reload'
