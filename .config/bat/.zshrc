export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

#            _              
#    _______| |__  _ __ ___ 
#   |_  / __| '_ \| '__/ __|
#  _ / /\__ \ | | | | | (__ 
# (_)___|___/_| |_|_|  \___|
#                           
# -----------------------------------------------------
# By Aditya
# -----------------------------------------------------

#Set the directory to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

#Download Zinit, if it's not there yet
if [ ! -d "${ZINIT_HOME}" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Enable true color support in the terminal for better color rendering
export COLORTERM=truecolor

# Setting up terminal prompt to oh-my-posh
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Sourcing kitty.sh for dynamic kitty configurations
source ~/.config/kitty/kitty.sh

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit ice wait"0" # Loads these plugins after the prompt is set up.

# Load zsh-completions
autoload -U compinit && compinit -C

# Keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# History
HISTSIZE=3000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -A --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -A --color=always $realpath'

# Variables
cat='batcat'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias cat='${cat}'
alias fzf='fzf --preview="${cat} --color=always {}"'
alias fnvim='nvim $(fzf -m --preview="${cat} --color=always {}")'

# Shell integrations
# source <(fzf --zsh)
# --zsh options are only available in fzf 0.48.0 or later. 
eval "$(zoxide init --cmd cd zsh)"
