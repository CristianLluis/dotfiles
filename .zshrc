# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="cll"


# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl)

# use "code ." to open vscode
export EDITOR="code --wait"

# load zsh
source $ZSH/oh-my-zsh.sh

#git alias
alias gs="git status"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias gcam="git commit -a --amend --no-edit"
alias gallcampf="git add -A && git commit --amend --no-edit && git push -f"
alias machsgeil="isort . && black . && flake8"

# kubernetes alias
alias k=kubectl
alias ks=kubectx
alias kns=kubens
alias seal="kubeseal --controller-namespace kube-system --controller-name sealed-secrets --format yaml"
alias argocd="kubectl port-forward -n argocd svc/argocd-server 8080:80"
alias secret="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"

# compiler flags
export LDFLAGS="-L/usr/local/opt/readline/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/openldap/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openldap/include -I/usr/local/opt/bzip2/include"
export CFLAGS="-I/usr/local/opt/readline/include -I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openldap/include -I/usr/local/opt/bzip2/include"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/bzip2/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/zlib/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/opt/openldab/lib/pkgconfig"

# kubeswitch
source /usr/local/opt/switch/switch.sh

# pyenv
eval "$(pyenv init --path)"

# locale - for keeping git cli in english and not in german!
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Expose homebrew's sbin directory
export PATH="/usr/local/sbin:$PATH"
