# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/bin:/usr/local/bin:$HOME/.local/bin

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="linuxonly"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
    asdf
    composer
    dnf
    fzf
    git
    kubectl
    minikube
    npm
    starship
    zsh-autosuggestions
    zsh-syntax-highlighting
	pip
	snap
	kind
)

# Configuração do FZF para o Oh my ZSH
export FZF_DEFAULT_COMMAND='fzf'

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
#

alias rsync='rsync -h --info=PROGRESS2,STATS1'
alias sup='sudo dnf upgrade --refresh -y && flatpak update -y'
alias svi='sudo nvim'
alias vi='nvim'
alias torg='$HOME/apps/time-organizer/main.py'
alias docker-use-minikube='eval $(minikube docker-env)'
alias gdrive-pessoal='rclone mount gdrive-pessoal: $HOME/gdrive/gdrive-pessoal \
	--buffer-size=64M \
    --dir-cache-time=24h \
    --poll-interval=10s \
    --transfers=16 \
   	--write-back-cache \
	--daemon \
	--vfs-cache-mode=full \
    --vfs-cache-max-size=512M \
    --vfs-cache-max-age=24h \
    --vfs-read-ahead=64M \
    --drive-chunk-size=64M \
    --drive-pacer-min-sleep=10ms \
    --drive-pacer-burst=200 \
	--drive-skip-gdocs
'

# Configurações de Ferramentas

# ASDF
if [[ -d $HOME/.asdf/ ]]; then
    # Configuração da JAVA_HOME do plugin Java do ASDF
    source $HOME/.asdf/plugins/java/set-java-home.zsh
fi

# Krew Plugin para Kubectl
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# Kompose completion
source <(kompose completion zsh)

# Helm completion
source <(helm completion zsh)

# Configuração de certificados para apps Node
export NODE_EXTRA_CA_CERTS=/etc/ssl/certs/ca-certificates.crt

