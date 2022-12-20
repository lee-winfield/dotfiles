# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
        git
	git-prune
        zsh-autosuggestions
        zsh-syntax-highlighting
        z
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Use: keychain-environment-variable SECRET_ENV_VAR
function keychain-environment-variable () {
    security find-generic-password -w -a ${USER} -D "environment variable" -s "${1}"
}

# Use: set-keychain-environment-variable SECRET_ENV_VAR
#   provide: super_secret_key_abc123
function set-keychain-environment-variable () {
    [ -n "$1" ] || print "Missing environment variable name"

    # Note: if using bash, use `-p` to indicate a prompt string, rather than the leading `?`
    read -s "?Enter Value for ${1}: " secret

    ( [ -n "$1" ] && [ -n "$secret" ] ) || return 1
    security add-generic-password -U -a ${USER} -D "environment variable" -s "${1}" -w "${secret}"
}

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Custom Env Vars from Keychain
export MONGO_PROD_READ_USER=$(keychain-environment-variable MONGO_PROD_READ_USER)
export MONGO_PROD_READ_PASS=$(keychain-environment-variable MONGO_PROD_READ_PASS)

export MONGO_PROD_WRITE_USER=$(keychain-environment-variable MONGO_PROD_WRITE_USER)
export MONGO_PROD_WRITE_PASS=$(keychain-environment-variable MONGO_PROD_WRITE_PASS)

export MONGO_STAGE_WRITE_USER=$(keychain-environment-variable MONGO_STAGE_WRITE_USER)
export MONGO_STAGE_WRITE_PASS=$(keychain-environment-variable MONGO_STAGE_WRITE_PASS)

export PG_SANDBOX_READER_HOST=$(keychain-environment-variable PG_SANDBOX_READER_HOST)
export PG_SANDBOX_HOST=$(keychain-environment-variable PG_SANDBOX_HOST)
export PG_SANDBOX_WRITE_USER=$(keychain-environment-variable PG_SANDBOX_WRITE_USER)
export PG_SANDBOX_WRITE_PASS=$(keychain-environment-variable PG_SANDBOX_WRITE_PASS)

export PG_STAGE_WRITE_USER=lee_stage_admin
export PG_STAGE_WRITE_PASS=$(keychain-environment-variable PG_STAGE_WRITE_PASS)

export PG_PROD_WRITE_USER=lee_prod_write
export PG_PROD_WRITE_PASS=$(keychain-environment-variable PG_PROD_WRITE_PASS)
export PG_PROD_READ_USER=lee_prod_read
export PG_PROD_READ_PASS=$(keychain-environment-variable PG_PROD_READ_PASS)
export PG_PROD_READ_HOST=postgres-prod.cluster-ro-c1wxdp1zab0n.us-east-2.rds.amazonaws.com
export PG_PROD_WRITE_HOST=postgres-prod.cluster-c1wxdp1zab0n.us-east-2.rds.amazonaws.com

code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

# Keypad
# 0 . Enter
bindkey -s "^[Op" "0"
bindkey -s "^[On" "."
# 1 2 3
bindkey -s "^[Oq" "1"
bindkey -s "^[Or" "2"
bindkey -s "^[Os" "3"
# 4 5 6
bindkey -s "^[Ot" "4"
bindkey -s "^[Ou" "5"
bindkey -s "^[Ov" "6"
# 7 8 9
bindkey -s "^[Ow" "7"
bindkey -s "^[Ox" "8"
bindkey -s "^[Oy" "9"
# + -  * /
bindkey -s "^[Ol" "+"
bindkey -s "^[Om" "-"
bindkey -s "^[Oj" "*"
bindkey -s "^[Oo" "/"

alias vim="nvim"
