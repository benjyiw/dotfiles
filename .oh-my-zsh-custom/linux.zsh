if [[ ${OSTYPE} == linux-gnu ]]; then

  if [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then
    export PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
  fi

  alias clearclip="echo -n | xclip -selection clipboard"
  alias clip="xclip -i -selection clipboard"

  # prevents ctrl-s/ctrl-q from freezing the terminal
  stty -ixon
fi
