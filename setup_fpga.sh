source /opt/Xilinx/Vivado/2018.2/settings64.sh
source ~/source/petalinux/2018.2/settings.sh
export AI_SOURCE=~/source/sports_radar
export PATH=$PATH:$AI_SOURCE/python/progs:/opt/intel/18.1/quartus/bin

if [ -z "${PYTHONPATH:-}" ]
then
    export PYTHONPATH=$AI_SOURCE/python
else                
    export PYTHONPATH=$AI_SOURCE/python:${PYTHONPATH}
fi

#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
#export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
#export PS1="\\w\$(__git_ps1 '(%s)') \$ "
#export PS1="\\w:\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$ "
#export PS1="\h\w:$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$ "
export PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\] \$\[\033[0m\033[0;32m\] ▶\[\033[0m\] '
