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
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# fuck any other timestamp format
HIST_STAMPS="yyyy-mm-dd"

ZSH_CUSTOM=~/.oh-my-zsh-custom

plugins=(
  shrink-path
)

source $ZSH/oh-my-zsh.sh

# old ls colors from way back when
LSCOLORS=exfxcxdxbxGxDxabagacad
