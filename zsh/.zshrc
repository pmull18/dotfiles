# Directory where zinit and plugins are stored
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# export PATH="$HOME/miniconda3/bin:$PATH"  # commented out by conda initialize

#Download Zinit if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname "$ZINIT_HOME")"
	git clone git@github.com:zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

#zsh plugins
zinit light Aloxaf/fzf-tab
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

#Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

#History
HISTSIZE=5000
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
zstyle ':completion:*' list-colors "{(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

eval "$(starship init zsh)"

# Aliases
alias ls='ls --color'
alias la='ls -a'
alias sync-wez="cp ~/dotfiles/wezterm/.wezterm.lua /mnt/c/Users/Patrick/.wezterm.lua"

alias sioyek="open -a Sioyek"

#Shell Integrations
eval "$(fzf --zsh)"
autoload -U compinit && compinit -u
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/patrickmullen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/patrickmullen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/patrickmullen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/patrickmullen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

