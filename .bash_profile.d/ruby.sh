if [ -n "$BASH_VERSION" ] || [ -n "$ZSH_VERSION" ]; then
  # enable chruby (https://github.com/postmodern/chruby)
  [ -r /usr/local/opt/chruby/share/chruby/chruby.sh ] && source /usr/local/opt/chruby/share/chruby/chruby.sh # mac
  [ -r /usr/local/share/chruby/chruby.sh ] && source /usr/local/share/chruby/chruby.sh # ubuntu
  # enable auto-switching of Rubies specified by .ruby-version files
  [ -r /usr/local/opt/chruby/share/chruby/auto.sh ] && source /usr/local/opt/chruby/share/chruby/auto.sh # mac
  [ -r /usr/local/share/chruby/auto.sh ] && source /usr/local/share/chruby/auto.sh # ubuntu
fi

function set_perf_vars() {
  # export RUBY_HEAP_MIN_SLOTS=1000000
  # export RUBY_HEAP_SLOTS_INCREMENT=1000000
  # export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
  # export RUBY_GC_MALLOC_LIMIT=1000000000
  # export RUBY_HEAP_FREE_MIN=500000
  # export RUBY_GC_MALLOC_LIMIT=268435456 # 256 megabytes
  export RUBY_GC_MALLOC_LIMIT=104857600 # 100 megabytes
  export RUBY_HEAP_FREE_MIN=200000
  export RUBY_HEAP_MIN_SLOTS=40000
}
function unset_perf_vars() {
  # unset RUBY_HEAP_MIN_SLOTS
  # unset RUBY_HEAP_SLOTS_INCREMENT
  # unset RUBY_HEAP_SLOTS_GROWTH_FACTOR
  # unset RUBY_GC_MALLOC_LIMIT
  # unset RUBY_HEAP_FREE_MIN
  unset RUBY_GC_MALLOC_LIMIT
  unset RUBY_HEAP_FREE_MIN
  unset RUBY_HEAP_MIN_SLOTS
}

# Ruby performance variables
# set_perf_vars
