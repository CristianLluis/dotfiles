# ==============================================
# ================ Oh My Zsh ===================
# ==============================================

# Create a symlink to home directory.
# ln -s ~/repos/dotfiles/.zshrc ~/.zshrc

export ZSH="$HOME/.oh-my-zsh"

# Using own custom stuff for omz. Inside this repos live all shared plugins I need for work
export ZSH_CUSTOM="$HOME/repos/dotfiles/histify/zsh"

plugins=(
    git
    docker
    docker-compose
    c-stsha
    hf-brew
    hf-k8s
    hf-ops
    hf-poros
    hf-proxy
    hf-teleport
)

source $ZSH/oh-my-zsh.sh
# ==============================================
# ================= Homebrew ===================
# ==============================================

export PATH="/Users/cristianlluis/bin:/usr/local/sbin:$PATH"
export HOMEBREW_BUNDLE_DUMP_NO_VSCODE=true

# Needed for hf-brew plugin
HF_BREWFILES=(
    $HOME/repos/dotfiles/Brewfile
    $HOME/repos/dotfiles/histify/brew/Brewfile
)
BREW_PREFIX=$(brew --prefix)

# ==============================================
# ================== VS Code ===================
# ==============================================

export EDITOR="code"

# ==============================================
# ==================== Git =====================
# ==============================================

export LC_ALL=en_US.UTF-8 # locale - for keeping git cli in english and not in german!
export LANG=en_US.UTF-8
source $HOME/repos/dotfiles/functions/remove_branches.sh
alias gs="git status"
alias gfix="git add -A && git commit --amend --no-edit && git push -f"
alias main="gco master && git pull -p && git remote prune origin"
alias rebase="main && gco - && git rebase master"
alias gba="git --no-pager branch -a"
alias glog="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)'"
alias gloga="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)' --all"


# ==============================================
# ================ Kubernetes ==================
# ==============================================

alias k=kubectl
alias ks=kubectx
alias kns=kubens

# Needed for hf-teleport plugin
HF_KH_USER=cll
HF_KH_OP_PASSWORD_REF="op://Employee/cll histify Teleport/password"
HF_KH_CLUSTERS=(hf-k8s-test hf-k8s-prod)

# ==============================================
# ============= Virtual Environments ===========
# ==============================================

export PIP_REQUIRE_VIRTUALENV=true
source $HOME/repos/dotfiles/functions/source_env.sh
source $HOME/repos/dotfiles/functions/search_files.sh
alias dac='deactivate'
alias machsgeil="_search_files && isort . && black . && flake8"


# ==============================================
# ================== Docker ====================
# ==============================================

alias dc="docker-compose"
alias d="docker"
alias rmconts="docker ps -aq | xargs docker rm -f && docker network prune -f"
# for Kevin 🤷🏻‍♀️
alias ambra="docker ps -aq | xargs docker rm -f && docker network prune -f"

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/cris/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# ==============================================
# ================== pyenv =====================
# ==============================================

eval "$(pyenv init --path)"

# ==============================================
# =================== fnm ======================
# ==============================================

eval "$(fnm env --use-on-cd)"

# ==============================================
# ==================crontab ====================
# ==============================================

# use vim for crontab as vscode somehow has issues with it
alias crontab='VISUAL=vim crontab'

# ==============================================
# =================== PDFJS ====================
# ==============================================

export DJANGO_PDFJS_LICENSE_KEY="EN2cV9vPsuEmhSY9XfXW"

# ==============================================
# ================== JAVA 🤷🏻‍♀️ ===================
# ==============================================

export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# ==============================================
# ========== Add custom bin to PATH ============
# ==============================================

export PATH="/Users/cris/repos/dotfiles/bin:$PATH"

# ==============================================
# ========= Starship terminal prompt ===========
# ==============================================

eval "$(starship init zsh)"

# ==============================================
# ================= Postgres ===================
# ==============================================

export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"

# ==============================================
# =================== Zinit ====================
# ==============================================

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
