if [[ ${OSTYPE} == linux-gnu ]]; then

  if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
  fi

  alias clearclip="echo -n | xclip -selection clipboard"

fi
