export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="bo"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# fuck any other timestamp format
HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM=~/.oh-my-zsh-custom

plugins=(
  shrink-path
  zsh-syntax-highlighting
  fzf
  pass
)

# i love history
HISTSIZE=500000
SAVEHIST=100000
source $ZSH/oh-my-zsh.sh

# use the correct editor.
export EDITOR=vim
export VISUAL=vim

# old ls colors from way back when
LSCOLORS=exfxcxdxbxGxDxabagacad

# reasonable aws pager
export PAGER="less -FRX"
export AWS_PAGER="less -FRX"

# fix colors
export TERM=xterm-256color

if [[ -d $HOME/.local/bin ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [[ -d $HOME/go/bin ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

if [[ -d $HOME/.pulumi/bin ]]; then
  export PATH="$HOME/.pulumi/bin:$PATH"
fi

if [[ -d /usr/local/go/bin ]]; then
  export PATH="/usr/local/go/bin:$PATH"
fi

# set locale for 24 hour time
export LC_TIME=C.UTF-8
