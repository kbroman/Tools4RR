# .bashrc

# node.js
. ~/.bin/nvm/nvm.sh             # node version manager
nvm use v0.8.18  > /dev/null     # current version of node
export NODE_PATH=~/.bin/nvm/v0.8.18/lib/node_modules/

# ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.


export path
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/.anaconda/anaconda/bin:$PATH
export PATH=$HOME/.anaconda/anaconda/envs/py33/bin:$PATH
export PATH=$PATH:.:$HOME/.bin:$HOME/.bin/genetics:$HOME/Projects/Db:$HOME/.bin/genetics/qtlcart
export PATH=$PATH:$HOME/Projects/Fuchs_May05/ELOD/Perl 
export PATH=$PATH:/usr/local/gcc4.0/bin
export PATH=$PATH:$HOME/.bin/genetics/bowtie-0.12.7:$HOME/.bin/genetics/samtools-0.1.12a:$HOME/.bin/genetics/tophatInstall/bin:$HOME/.bin/genetics/ncbi-blast-2.2.24+/bin
export SHELL=/bin/bash 
export MANPATH=$MANPATH:/usr/X11R6/man

# latex stuff located in /opt/local/share/texmf-dist/tex/latex
#   [now actually /opt/local/share/texmf-texlive-dist/tex/latex/]
#    if you add stuff; run "sudo texhash"
# 
# to ensure that latex uses letter paper, do:
#      sudo texinfo dvips paper letterPaper
# or   sudo texconfig paper letter

# need the following to use boost
export LD_LIBRARY_PATH=/usr/local/lib


PS1="[\h]\w[\!]\$ "

export GS_OPTIONS="-dAutoRotatePages=/None"

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

noclobber=1    # prevent overwriting of files
IGNOREEOF=1    # disable Ctrl-D as a way to exit
HISTCONTROL=ignoredups

alias top='top -u'
alias du='du -k'
alias cl='clear;cd'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='ls -GF'
alias 'l.'='ls -d .[a-zA-Z]*'
alias ll='ls -lh'
alias 'll.'='ls -Alh'
alias md='mkdir'
alias rd='rmdir'
alias rmb='rm .*~ *~ *.bak *.bk!' 
alias rmdvi='\rm *.dvi *.aux *.log'

alias lprrotate='enscript -r -MLetter'
alias lpr2col='enscript -2rj -MLetter'
alias lprsmall='enscript -j -MLetter'
alias gvl='gv -landscape'

alias gitpush='git push;git push --tags'

alias Ri='R CMD INSTALL --library=/Users/kbroman/Rlibs'
alias Rcc='R CMD check --as-cran --library=/Users/kbroman/Rlibs'
alias Rc='R CMD check --library=/Users/kbroman/Rlibs'
alias Rb='R CMD build --force --resave-data'

alias host='echo $HOSTNAME'
alias KarlBook4='ssh -2 -X KarlBook4.local'
alias fig='ssh -2 -X fig.local'

alias so='source ~/.bash_profile'

alias e=emacs

# color prompt to include branch information
function color_my_prompt {
    local __user_and_host="\[\033[01;32m\]\u@\h"
    local __cur_location="\[\033[01;34m\]\w"
    local __git_branch='`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\*\ \(.+\)$/\(\\\\\1\)\ /`'
    local __prompt_tail="\[\033[35m\]$"
    local __last_color="\[\033[00m\]"

    RED="\[\033[0;31m\]"
    YELLOW="\[\033[0;33m\]"
    GREEN="\[\033[0;32m\]"

    # Capture the output of the "git status" command.
    git_status="$(git status 2> /dev/null)"

    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "working directory clean" ]]; then
        state="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
        state="${YELLOW}"
    else
        state="${RED}"
    fi

    export PS1="$__user_and_host $__cur_location ${state}$__git_branch$__prompt_tail$__last_color "
}
# Tell bash to execute this function just before displaying its prompt.
PROMPT_COMMAND=color_my_prompt

# tar functions
tarx ()
{
    gzip -dc $1 | tar xvf -
}
tarc ()
{
    tar cvf $1.t $1
    gzip -S gz $1.t
}
tart ()
{
    gzip -dc $1 | tar tvf -
}

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
