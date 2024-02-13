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

#vscode alias
alias c="code ."

# git alias
alias gs="git status"
alias grc="git rebase --continue"
alias gra="git rebase --abort"
alias grs="git rebase --skip"
alias gallcampf="git add -A && git commit --amend --no-edit && git push -f"
alias main="gco master && git pull -p && grpo"
alias rebase="main && gco - && git rebase master"

# custom git alias overwriting plugin
alias gba="git --no-pager branch -a"
alias grpo="git remote prune origin"
alias glog="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)'"
alias gloga="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)' --all"

# kubernetes alias
alias k=kubectl
alias ks=kubectx
alias kns=kubens
alias seal="kubeseal --controller-namespace kube-system --controller-name sealed-secrets --format yaml"
alias secret="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"
alias argo="sh -c 'sleep 0.5 && open http://localhost:6001' &; kubectl port-forward -n argocd svc/argocd-server 6001:80"
alias longhorn="sh -c 'sleep 0.5 && open http://localhost:6002' &; kubectl port-forward deployment/longhorn-ui 6002:8000 -n longhorn-system"
alias rand64="openssl rand -hex 25 | tr -d '\n' | base64 | tr -d '\n' | pbcopy"
alias klogin="tsh kube login k8s-dls-prod && tsh kube login k8s-dls-test"

# docker & docker-compose
alias dc="docker-compose"
alias d="docker"
alias schickaues="docker ps -aq | xargs docker rm -f"

# venv
alias dac='deactivate'

# django alias
alias pmp="python manage.py"

# opendls shorthands
alias opendls="cd ~/repos/opendls"

# mycolex shorthands
alias update_index="dce backend python manage.py update_index"
alias rebuild_index="dce backend python manage.py rebuild_index"
alias mycolex="cd ~/repos/mycolex"

# python alias
alias machsgeil="_search_files && isort . && black . && flake8"
alias machsrichtiggeil="bin/isort . && bin/black . && bin/flake8"

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
export PATH="/Users/cristianlluis/bin:/usr/local/sbin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Touch and edit a file. I only use it for .feature, .bugfix, .other and .update changelog files
touchand() {
    if ! [ "$1" ]; then
        echo "need a file!" >&2
        return 1
    fi
    : > "$1" && vi "$1"
}

# used during file formatting and linting to look for debugging code
_search_files() {
    local error_found=0

    # searches for .only() in cypress files
    search_for_only() {
        local search_directory="./frontend/test"

        # Function to search for ".only" in .cy.js files using find
        search_cyjs_files() {
            local directory="$1"
            local cyjs_files=($(find "$directory" -type f -name "*.cy.js"))
            for file in "${cyjs_files[@]}"; do
                if grep -q -E '\.only' "$file"; then
                    echo "Error: Found '.only' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_cyjs_files "$search_directory"
    }

    # searches for debugger() in .js and .vue files
    search_for_debugger() {
        local search_directory="./frontend"

        # Function to search for "debugger" in .js and .vue files using find
        search_js_vue_files() {
            local directory="$1"
            local js_vue_files=($(find "$directory" \( -type d \( -name node_modules -o -name .nuxt \) -prune -false -o -type f \( -name "*.js" -o -name "*.vue" \) \)))
            for file in "${js_vue_files[@]}"; do
                if grep -q "debugger" "$file"; then
                    echo "Error: Found 'debugger' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_js_vue_files "$search_directory"
    }

    # searches for breakpoint() in .py files
    search_for_breakpoint() {
        local search_directory="./backend"

        # Function to search for "breakpoint()" in .py files using find
        search_py_files() {
            local directory="$1"
            local py_files=($(find "$directory" -type f -name "*.py"))
            for file in "${py_files[@]}"; do
                if grep -q "breakpoint()" "$file"; then
                    echo "Error: Found 'breakpoint()' in file '$file'"
                    error_found=1
                fi
            done
        }

        # Start the search in the specified directory
        search_py_files "$search_directory"
    }

    search_for_breakpoint
    search_for_debugger
    search_for_only

    if [ "$error_found" -eq 1 ]; then

    else
        echo "All good!"
    fi
}

# Searches for a virtual env in /. and in /venv. Then activates it.
alias sc="_source_venv"
_source_venv() {
    if source venv/bin/activate 2>/dev/null || source bin/activate 2>/dev/null; then
        # Virtual environment activated successfully
        return 0
    else
        # Virtual environment not found
        echo "Error: Virtual environment not found."
        return 1
    fi
}

# removes all branches which are fully merged and don't have a remote on origin anymore
remove_branches() {
  git branch -vv | grep ': gone]' | grep -v '*' | awk '{ print $1 }' | xargs git branch -d
}

# short for docker-compose up args. But asks if you really want to boot an entire project (opendls as like a million container)
up() {
    if [ "$#" -eq 0 ]; then
        local response
        vared -p "Really want to boot the whole app? (y/N) " response
        if [[ "$response" =~ ^[yY](es)?$ ]]; then
            dc up -d
        fi
    else
        dc up "$@" -d
    fi
}

# short for docker-compose down args. But asks if you really want to stop an entire project (opendls as like a million container)
down() {
    if [ "$#" -eq 0 ]; then
        local response
        vared -p "Really want to stop the whole app? (y/N) " response
        if [[ "$response" =~ ^[yY](es)?$ ]]; then
            dc down
        fi
    else
        dc down "$@"
    fi
}
