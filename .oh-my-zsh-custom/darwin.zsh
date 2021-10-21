if [[ ${OSTYPE} =~ ^darwin.* ]]; then

  # Iterm
  tab() {
    local exec_command="$@"
    osascript \
      -e 'tell application "iTerm" to activate' \
      -e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' \
      -e "tell application \"System Events\" to tell process \"iTerm\" to keystroke \"${exec_command}\"" \
      -e 'tell application "System Events" to tell process "iTerm" to key code 52'
  }

  # set iterm title
  title() {
    if [ "$1" ]; then
      echo -ne "\033]0;${*}\007"
    else
      echo -ne "\033]0;${PWD/#$HOME/~}\007"
    fi
  }

  # lock
  alias lock='open -a screensaverengine'
  alias sleepnow='pmset sleepnow'

  # fix dns
  alias cleardnscache='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'

fi
