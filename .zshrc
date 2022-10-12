# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

function get_cluster_short() {
        if [[ $1 == "local"  ]]; then
            echo "%{$fg[green]%}$1%{$fg[blue]%}\u2388"
        elif [[ $1 == *test*  ]]; then
            echo "%{$fg[yellow]%}$1🧽 "
        else
            echo "%{$fg[red]%}$1💥 "
        fi
    }

KUBE_PS1_SYMBOL_ENABLE="false"
KUBE_PS1_PREFIX=''
KUBE_PS1_DIVIDER=''
KUBE_PS1_SUFFIX=' '
KUBE_PS1_CLUSTER_FUNCTION=get_cluster_short

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}@"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}@"
PROMPT='$(kube_ps1)$(git_prompt_info)%{$fg_bold[cyan]%}%2~%{$reset_color%} %(?:%{$fg[green]%}➜:%{$fg_bold[red]%}✖)%{$reset_color%} '


# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git kubectl kube-ps1)

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
#custom git alias overwriting plugin
alias gba="git --no-pager branch -a"

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
alias dc="docker compose"


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
