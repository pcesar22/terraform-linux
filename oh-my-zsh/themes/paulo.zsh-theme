local cwd_color=$FG[153]
local pre_status="╭─ "
local ret_status="╰─ "
PROMPT='${pre_status}%{%B$cwd_color%}%~%{$reset_color%} $(git_prompt_info)
${ret_status}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
