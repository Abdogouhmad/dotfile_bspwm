# Enable Zsh profiling
# zmodload zsh/zprof

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="af-magic"

# Disable auto-update behavior
zstyle ':omz:update' mode disabled

# Plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    sudo
    fzf-tab
    colored-man-pages
)

# Source Oh My Zsh
source "$ZSH/oh-my-zsh.sh"

# Optimize compinit
autoload -Uz compinit
if [ "$(date +'%j')" != "$(stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)" ]; then
  compinit
else
  compinit -C
fi

# Aliases (keeping a subset of your original aliases)
alias zshconfig="helix ~/.zshrc"
alias ohmyzsh="thunar ~/.oh-my-zsh"
alias l='exa -l --icons'
alias ll='exa -la --icons'
alias ls='exa --color=auto --icons'
alias cat='bat --theme=gruvbox-dark'
alias c='clear'
alias gc='gcc -Wall -pedantic -Werror -Wextra -std=gnu89'
alias hx='helix'
alias dir='mkdir -p'
# Environment variables
export EDITOR=helix
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$PNPM_HOME:$HOME/.cargo/bin:$HOME/.bun/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
export ANDROID_HOME="/opt/android-sdk"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH"

# Lazy load certain functions and completions
lazy_load() {
    local cmd="$1"
    local script="$2"
    eval "${cmd}() { unset -f ${cmd}; source ${script}; ${cmd} \$@ }"
}

# Lazy load thefuck
lazy_load thefuck 'eval $(thefuck --alias)'

# Lazy load z
eval "$(zoxide init zsh)"

# Lazy load bun completions
lazy_load bun "$HOME/.bun/_bun"

# Lazy load terraform completions
lazy_load terraform 'complete -o nospace -C /usr/bin/terraform terraform'


# End of profiling
# zprof
