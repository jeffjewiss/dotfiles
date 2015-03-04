set fish_greeting

set -x EDITOR vim
set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x RBENV_ROOT /usr/local/var/rbenv

# Paths
test -d /usr/local/share/npm/bin ; and set PATH /usr/local/share/npm/bin $PATH
test -d /usr/local/heroku/bin    ; and set PATH /usr/local/heroku/bin $PATH
test -d /usr/local/sbin          ; and set PATH /usr/local/sbin $PATH
test -d /usr/local/bin           ; and set PATH /usr/local/bin $PATH
test -d ~/.bin                   ; and set PATH ~/.bin $PATH

# Navigation
function ..    ; cd .. ; end
function ...   ; cd ../.. ; end
function ....  ; cd ../../.. ; end
function ..... ; cd ../../../.. ; end
function l     ; tree --dirsfirst -aFCNL 1 $argv ; end
function ll    ; tree --dirsfirst -ChFupDaLg 1 $argv ; end

# Utilities
function ag       ; command ag --ignore=.git --ignore=log --ignore=tags --ignore=tmp --ignore=vendor --ignore=spec/vcr $argv ; end
function b        ; bundle exec $argv ; end
function c        ; pygmentize -O style=monokai -f console256 -g $argv ; end
function d        ; du -h -d=1 $argv ; end
function df       ; command df -h $argv ; end
function digga    ; command dig +nocmd $argv[1] any +multiline +noall +answer; end
function g        ; git $argv ; end
function grep     ; command grep --color=auto $argv ; end
function httpdump ; sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E "Host\: .*|GET \/.*" ; end
function ip       ; curl -s http://checkip.dyndns.com/ | sed 's/[^0-9\.]//g' ; end
function localip  ; ipconfig getifaddr en0 ; end
function tma      ; tmux attach -d -t $argv ; end
function tmux     ; command tmux -2 $argv ; end
function tunnel   ; ssh -D 8080 -C -N $argv ; end
function view     ; vim -R $argv ; end
function vp       ; vim $argv ; end

# Completions
function make_completion --argument-names alias command
    echo "
    function __alias_completion_$alias
        set -l cmd (commandline -o)
        set -e cmd[1]
        complete -C\"$command \$cmd\"
    end
    " | .
    complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion b 'bundle exec'
make_completion mp 'vim -p'
make_completion tma 'tmux attach -d -t'
make_completion vp 'vim -p'

# rbenv
if test -d $RBENV_ROOT
  set PATH $RBENV_ROOT/bin $PATH
  set PATH $RBENV_ROOT/shims $PATH
  rbenv rehash >/dev/null ^&1
end
