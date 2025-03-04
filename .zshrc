# ==============================================
# ================ Oh My Zsh ===================
# ==============================================

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship" # https://github.com/spaceship-prompt/spaceship-prompt
plugins=(git docker docker-compose kubectl)
source $ZSH/oh-my-zsh.sh
source $HOME/repos/dotfiles/spaceship_config.zsh

# ==============================================
# ================= Homebrew ===================
# ==============================================

export PATH="/Users/cristianlluis/bin:/usr/local/sbin:$PATH"
BREW_PREFIX=$(brew --prefix)

# ==============================================
# ================== VS Code ===================
# ==============================================

export EDITOR="code"
source $HOME/repos/dotfiles/functions/open_vscode.sh

# ==============================================
# ==================== Git =====================
# ==============================================

export LC_ALL=en_US.UTF-8 # locale - for keeping git cli in english and not in german!
export LANG=en_US.UTF-8
source $HOME/repos/dotfiles/functions/remove_branches.sh
alias gs="git status"
alias jöner="git add -A && git commit --amend --no-edit && git push -f"
alias main="gco master && git pull -p && grpo"
alias rebase="main && gco - && git rebase master"
alias gba="git --no-pager branch -a"
alias grpo="git remote prune origin"
alias glog="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)'"
alias gloga="git log --pretty='%C(yellow)%h %C(cyan)%cd %Cblue%aN ⇒%C(auto)%d %Creset%s' --graph --date=format:'%d-%m-%y(%H:%M)' --all"

# ==============================================
# ================ Kubernetes ==================
# ==============================================

source $HOME/repos/dotfiles/functions/activate-teleport.zsh
alias k=kubectl
alias ks=kubectx
alias kns=kubens
alias klogin="tsh kube login k8s-dls-prod && tsh kube login k8s-dls-test"
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

# ==============================================
# ================= Django =====================
# ==============================================

alias pmp="python manage.py"

# ==============================================
# ============ Project shorthands ==============
# ==============================================

source $HOME/repos/dotfiles/functions/touchand.sh
alias agora="cd ~/repos/agora"
alias oikos="cd ~/repos/oikos"
alias zug="cd ~/repos/dls-zug"
alias update_index="dce backend python manage.py update_index"
alias rebuild_index="dce backend python manage.py rebuild_index"

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

# libxlst
export PATH="/opt/homebrew/opt/libxslt/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libxslt/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libxslt/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxslt/lib/pkgconfig"

# libxml2
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/libxml2/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libxml2/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig"

# postgresql
export PATH="$BREW_PREFIX/opt/postgresql@14/bin:$PATH"
export LDFLAGS="-L$BREW_PREFIX/opt/postgresql@14/lib $LDFLAGS"
export CPPFLAGS="-I$BREW_PREFIX/opt/postgresql@14/include $CPPFLAGS"
export PKG_CONFIG_PATH="$BREW_PREFIX/opt/postgresql@14/lib/pkgconfig $PKG_CONFIG_PATH"

# postgis variables for django
export GDAL_LIBRARY_PATH="$BREW_PREFIX/lib/libgdal.dylib"
export GEOS_LIBRARY_PATH="$BREW_PREFIX/lib/libgeos_c.dylib"

# ==============================================
# ======== ImageMagick compiler Flags ==========
# ==============================================

export MAGICK_HOME="$BREW_PREFIX/opt/imagemagick"
export PATH="$BREW_PREFIX/opt/imagemagick/bin:$PATH"

# ==============================================
# ================== Docker ====================
# ==============================================

source $HOME/repos/dotfiles/functions/dc_up.sh
source $HOME/repos/dotfiles/functions/dc_down.sh
alias dc="docker-compose"
alias d="docker"
alias rmconts="docker ps -aq | xargs docker rm -f && docker network prune -f"

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
