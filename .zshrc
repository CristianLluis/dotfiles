# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

SPACESHIP_VENV_PREFIX="("
SPACESHIP_VENV_SUFFIX=") "
SPACESHIP_VENV_COLOR="blue"
SPACESHIP_ASYNC_SHOW="false"
SPACESHIP_GIT_PREFIX=""
SPACESHIP_GIT_ASYNC="false"
SPACESHIP_GIT_STATUS_SHOW="false"
SPACESHIP_PROMPT_ADD_NEWLINE="false"
SPACESHIP_PROMPT_SEPARATE_LINE="false"
SPACESHIP_PACKAGE_SHOW="false"
SPACESHIP_USER_SHOW="false"
SPACESHIP_HOST_SHOW="false"
SPACESHIP_HG_SHOW="false"
SPACESHIP_HG_BRANCH_SHOW="false"
SPACESHIP_HG_STATUS_SHOW="false"
SPACESHIP_PYTHON_SHOW="false"
SPACESHIP_PYTHON_ASYNC="false"
SPACESHIP_ELM_SHOW="false"
SPACESHIP_ELIXIR_SHOW="false"
SPACESHIP_XCODE_SHOW_LOCAL="false"
SPACESHIP_SWIFT_SHOW_LOCAL="false"
SPACESHIP_GOLANG_SHOW="false"
SPACESHIP_PHP_SHOW="false"
SPACESHIP_RUST_SHOW="false"
SPACESHIP_HASKELL_SHOW="false"
SPACESHIP_JULIA_SHOW="false"
SPACESHIP_DOCKER_SHOW="false"
SPACESHIP_AWS_SHOW="false"
SPACESHIP_CONDA_SHOW="false"
SPACESHIP_DOTNET_SHOW="false"
SPACESHIP_EMBER_SHOW="false"
SPACESHIP_KUBECTL_CONTEXT_SHOW="false"
SPACESHIP_KUBECTL_SHOW="false"
SPACESHIP_TERRAFORM_SHOW="false"
SPACESHIP_EXEC_TIME_SHOW="false"
SPACESHIP_BATTERY_SHOW="false"
SPACESHIP_VI_MODE_SHOW="false"
SPACESHIP_NODE_SHOW="false"

# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker docker-compose kubectl kube-ps1)

# load zsh
source $ZSH/oh-my-zsh.sh

# use "code ." to open vscode
export EDITOR="code --wait"

#git alias
alias gs="git status"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias gcam="git commit -a --amend --no-edit"
alias gallcampf="git add -A && git commit --amend --no-edit && git push -f"
alias machsgeil="isort . && black . && flake8"
alias machsrichtiggeil="bin/isort . && bin/black . && bin/flake8"

# I allways mess up git pull... My fingers just seem to want to write gitp ull...
alias gitp="git "
alias ull='pull'

#custom git alias overwriting plugin
alias glg="git --no-pager log --graph --abbrev-commit --decorate --format=format:'%C(bold yellow)%d%C(reset) - %C(white)%s%C(reset) %C(magenta)- %an%C(reset) -%C(cyan)%h%C(reset) @%C(green)(%ar)%C(reset)' --all -20"
alias gba="git --no-pager branch -a"
alias main="gco master"
alias grpo="git remote prune origin"

# kubernetes alias
alias k=kubectl
alias ks=kubectx
alias kns=kubens
alias seal="kubeseal --controller-namespace kube-system --controller-name sealed-secrets --format yaml"
alias secret="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"
alias argo="sh -c 'sleep 0.5 && open http://localhost:6001' &; kubectl port-forward -n argocd svc/argocd-server 6001:80"
alias longhorn="sh -c 'sleep 0.5 && open http://localhost:6002' &; kubectl port-forward deployment/longhorn-ui 6002:8000 -n longhorn-system"
alias rand64="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"

# docker & docker-compose
alias dc="docker-compose"
alias d="docker"
alias schickaues="docker ps -aq | xargs docker rm -f"
alias dps="docker ps | less -S"
alias dcps="docker-compose ps | less -S"

# venv
alias activate="source venv/bin/activate"

# django alias
alias pmp="python manage.py"

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

# make a virtual env mandatory for pip
export PIP_REQUIRE_VIRTUALENV=true
# global pip function for bypassing virtuel env obligation
gpip() {
    PIP_REQUIRE_VIRTUALENV="" "$@"
}

# locale - for keeping git cli in english and not in german!
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Expose homebrew's sbin directory
export PATH="/usr/local/sbin:$PATH"

#thefuck package
eval $(thefuck --alias)

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

touchand() {
    if ! [ "$1" ]; then
        echo "need a file!" >&2
        return 1
    fi
    : > "$1" && vi "$1"
}

# opendls shorthands
alias external-web="dc up external-frontend web external-solr create-s3-buckets internal-backend -d"
