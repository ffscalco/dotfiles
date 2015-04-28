[ -n "$PS1" ] && source ~/.bash_profile

cd .

if test -f ~/.rvm/scripts/rvm; then
  [ "$(type -t rvm)" = "function" ] || source ~/.rvm/scripts/rvm
fi

source "$HOME/.AWS/contabilone/users/fabiano.scalco@gmail.com/profile.sh"
PATH=$PATH:$HOME/.rvm/bin:$HOME/.AWS/certman/bin:/usr/local/heroku/bin # Add RVM to PATH for scripting
export JAVA_HOME="/usr/java/latest"

# mkdir, cd into it
mkcd () {
  mkdir -p "$*"
  cd "$*"
}
