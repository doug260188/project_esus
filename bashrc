export TZ=America/Cuiaba

echo '$IMAGE_ALIAS'

echo '$INFO_IMAGE'

export PS1="\[$(tput bold)\][\[\e[33m\]debian-PEC\[\e[m\]\[$(tput bold)\]] \[$(tput bold)\]\[\033[38;5;4m\]\w\[$(tput sgr0)\]\[$(tput sgr0)\]\[\033[38;5;15m\]\[$(tput sgr0)\]\$(__git_ps1) # "

alias ls='ls --color=auto'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#service e-SUS-AB-PostgreSQL start
#["java", "-jar", "eSUS-AB-PEC-5.1.17-Linux64.jar"]

#echo 'Aguarde...'
#sleep 300
