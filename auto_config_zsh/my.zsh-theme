PROMPT='%(?,%{$fg[green]%},%{$fg[red]%}) # '
RPS1=' # %{$terminfo[bold]$fg[yellow]%}%c/ %$(git_prompt_info) %{$fg[cyan]%}%D{[%H:%M:%S]}%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[green]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}%{$fg[yellow]%}"
