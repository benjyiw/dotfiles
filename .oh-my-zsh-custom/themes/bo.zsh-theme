# customized sorin theme

if [[ -n $SSH_CONNECTION ]]; then
  local user_host="%{$fg[yellow]%}$USER%{$reset_color%}@%{$fg[red]%}%m%{$reset_color%}"
else
  local user_host=""
fi

if [[ "$TERM" != "dumb" ]] && [[ "$DISABLE_LS_COLORS" != "true" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}❮%{$reset_color%}%{$fg[red]%}❮❮%{$reset_color%}"
  local return_status="%{$fg[red]%}%(?..✘ %?)%{$reset_color%}"

  #PROMPT='%{$fg[cyan]%}%c$(git_prompt_info) %(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} '
  PROMPT='${user_host} %{$fg[blue]%}$(shrink_path -f)$(git_prompt_info) %{$fg[red]%}❯%{$fg[yellow]%}❯%(!.%{$fg_bold[red]%}#.%{$fg_bold[green]%}❯)%{$reset_color%} '

  ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[red]%}"
  ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)%{$reset_color%}'

  ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%} ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[blue]%} ✱"
  ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%} ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%} ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ◼"
  ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[magenta]%} ⬆"
  ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[magenta]%} ⬇"
  ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[red]%} ≠"
  ZSH_THEME_GIT_PROMPT_DIVERGED="%{$fg[cyan]%} ★"
  
else
  MODE_INDICATOR="❮❮❮"
  local return_status="%(?::⏎)"

  PROMPT='%c$(git_prompt_info) %(!.#.❯) '

  ZSH_THEME_GIT_PROMPT_PREFIX=" git:"
  ZSH_THEME_GIT_PROMPT_SUFFIX=""
  ZSH_THEME_GIT_PROMPT_DIRTY=""
  ZSH_THEME_GIT_PROMPT_CLEAN=""

  RPROMPT='${return_status}$(git_prompt_status)'

  ZSH_THEME_GIT_PROMPT_ADDED=" ✚"
  ZSH_THEME_GIT_PROMPT_MODIFIED=" ✱"
  ZSH_THEME_GIT_PROMPT_DELETED=" ✖"
  ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
  ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
  ZSH_THEME_GIT_PROMPT_UNTRACKED=" ◼"
  ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
  ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
  ZSH_THEME_GIT_PROMPT_DIVERGED=" ≠"
  ZSH_THEME_GIT_PROMPT_DIVERGED=" ★"
fi
