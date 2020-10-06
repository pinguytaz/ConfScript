# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
#shopt      https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
# Si no corre interactivamente no hace nada
case $- in
    *i*) ;;
      *) return;;
esac

#Logo Sistema
#screenfetch

#Configuracion Historico
# No guarda comandos que empiezan en blanco
HISTCONTROL=ignoreboth

# Se añade a HISTFILE
shopt -s histappend

# Lineas en memoria y en el fichero historico (1000 y 2000)
HISTSIZE=50
HISTFILESIZE=100

#  Chequea tamaño ventana en cada comando y actualiza LINES and COLUMNS.
shopt -s checkwinsize

#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

NADA="\[\033[0m\]"    # quita color
# regular colors
K="\[\033[1;30m\]"    # black
R="\[\033[1;31m\]"    # red
G="\[\033[1;32m\]"    # green
Y="\[\033[1;33m\]"    # yellow
B="\[\033[1;34m\]"    # blue
M="\[\033[1;35m\]"    # magenta
C="\[\033[1;36m\]"    # cyan
W="\[\033[1;37m\]"    # white
#background colors
BGK="\[\033[40m\]"
BGR="\[\033[41m\]"
BGG="\[\033[42m\]"
BGY="\[\033[43m\]"
BGB="\[\033[44m\]"
BGM="\[\033[45m\]"
BGC="\[\033[46m\]"
BGW="\[\033[47m\]"

PS1="$R\u@\h$Y$BGB(\A)$NADA$R:$B\w$NADA\$ "

# Para cuando es un xterm title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enablt programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
