# Create a symlink to the oh-my-zsh custom themes folder.
# ln -s ~/repos/dotfiles/cll.zsh-theme ~/.oh-my-zsh/custom/themes/cll.zsh-theme

function _virtualenv_prompt_info {
  local venv_info=$(virtualenv_prompt_info)
  if [[ -n "$venv_info" ]]; then
    echo "${venv_info} "
  fi
}

PROMPT='%{$fg_bold[green]%} %{$fg[cyan]%}%~%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} $(_virtualenv_prompt_info)% %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" (%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
