# ==============================================
# ================ Oh My Zsh ===================
# ==============================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship" # https://github.com/spaceship-prompt/spaceship-prompt
plugins=(git docker docker-compose kubectl)
source $ZSH/oh-my-zsh.sh
source $HOME/repos/dotfiles/spaceship_config.zsh

# ==============================================
# ================== VS Code ===================
# ==============================================

export EDITOR="code --wait"
source $HOME/repos/dotfiles/functions/open_vscode.sh

# ==============================================
# ==================== Git =====================
# ==============================================

export LC_ALL=en_US.UTF-8 # locale - for keeping git cli in english and not in german!
export LANG=en_US.UTF-8
source $HOME/repos/dotfiles/functions/remove_branches.sh
alias gs="git status"
alias gallcampf="git add -A && git commit --amend --no-edit && git push -f"
alias main="gco master && git pull -p && grpo"
alias rebase="main && gco - && git rebase master"
alias gba="git --no-pager branch -a"
alias grpo="git remote prune origin"
alias glog="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)'"
alias gloga="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)' --all"

# ==============================================
# ================ Kubernetes ==================
# ==============================================

alias k=kubectl
alias ks=kubectx
alias kns=kubens
alias argo="sh -c 'sleep 0.5 && open http://localhost:6001' &; kubectl port-forward -n argocd svc/argocd-server 6001:80"
alias klogin="tsh kube login k8s-dls-prod && tsh kube login k8s-dls-test"
alias longhorn="sh -c 'sleep 0.5 && open http://localhost:6002' &; kubectl port-forward deployment/longhorn-ui 6002:8000 -n longhorn-system"
alias rand64="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"
alias seal="kubeseal --controller-namespace kube-system --controller-name sealed-secrets --format yaml"
alias secret="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"

# ==============================================
# ============= Virtual Environments ===========
# ==============================================

export PIP_REQUIRE_VIRTUALENV=true
source $HOME/repos/dotfiles/functions/gpip.sh
source $HOME/repos/dotfiles/functions/source_env.sh
source $HOME/repos/dotfiles/functions/search_files.sh
alias dac='deactivate'
alias machsgeil="_search_files && isort . && black . && flake8"
alias machsrichtiggeil="bin/isort . && bin/black . && bin/flake8"

# ==============================================
# ================= Django =====================
# ==============================================

alias pmp="python manage.py"

# ==============================================
# ============ Project shorthands ==============
# ==============================================

source $HOME/repos/dotfiles/functions/touchand.sh
alias opendls="cd ~/repos/opendls"
alias update_index="dce backend python manage.py update_index"
alias rebuild_index="dce backend python manage.py rebuild_index"
alias mycolex="cd ~/repos/mycolex"

# ==============================================
# ============== Compiler Flags ================
# ==============================================

export LDFLAGS="-L/usr/local/opt/readline/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openldap/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openldap/include -I/usr/local/opt/bzip2/include"
export CFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openldap/include -I/usr/local/opt/bzip2/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/bzip2/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openldab/lib/pkgconfig"

# ==============================================
# ================== Docker ====================
# ==============================================

source $HOME/repos/dotfiles/functions/dc_up.sh
source $HOME/repos/dotfiles/functions/dc_down.sh
alias dc="docker-compose"
alias d="docker"
alias rmconts="docker ps -aq | xargs docker rm -f"

# ==============================================
# ================== pyenv =====================
# ==============================================

eval "$(pyenv init --path)"

# ==============================================
# ================= Homebrew ===================
# ==============================================

export PATH="/Users/cristianlluis/bin:/usr/local/sbin:$PATH"

# ==============================================
# =================== nvm ======================
# ==============================================

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
