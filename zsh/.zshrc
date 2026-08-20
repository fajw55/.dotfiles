if command -v mise &> /dev/null; then
	eval "$(mise activate zsh)"
fi

if command -v starship &> /dev/null; then
	eval "$(starship init zsh)"
fi

if command -v zoxide &> /dev/null; then
	eval "$(zoxide init zsh)"
fi

export EDITOR='nvim'
export VISUAL='nvim'

autoload -Uz compinit
compinit

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=20000
HISTSIZE=19999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- FZF ---
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"

  # --- setup fzf theme ---
  fg="#CBE0F0"
  bg="#011628"
  bg_highlight="#143652"
  purple="#B388FF"
  blue="#06BCE4"
  cyan="#2CF9ED"

  export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

  # -- Use fd instead of fzf --
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

  # Use fd (https://github.com/sharkdp/fd) for listing path candidates.
  # - The first argument to the function ($1) is the base path to start traversal
  # - See the source code (completion.{bash,zsh}) for the details.
  _fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
  }

  # Use fd to generate the list for directory completion
  _fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
  }

  source ~/fzf-git.sh/fzf-git.sh

  show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

  export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
  export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

  # Advanced customization of fzf options via _fzf_comprun function
  # - The first argument to the function is the name of the command.
  # - You should make sure to pass the rest of the arguments to fzf.
  _fzf_comprun() {
    local command=$1
    shift

    case "$command" in
      cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
      export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
      ssh)          fzf --preview 'dig {}'                   "$@" ;;
      *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
    esac
  }
fi

# --- PNPM ---
if command -v pnpm &> /dev/null; then
  alias pn="pnpm"

  export PNPM_HOME="$HOME/.local/share/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac
fi

# --- Opencode ---
if [ -d "$HOME/.opencode/bin" ]; then
  export PATH="$HOME/.opencode/bin:$PATH"
fi

# Added by CodeRabbit CLI installer
# export PATH="/Users/AlanJ/.local/bin:$PATH"

# --- Bat (better cat) ---
export BAT_THEME="Catppuccin Macchiato"

# Use custom `less` colors for `man` pages.
export LESS_TERMCAP_md="$(tput bold 2> /dev/null; tput setaf 2 2> /dev/null)"
export LESS_TERMCAP_me="$(tput sgr0 2> /dev/null)"

# --- Azure CLI ---
autoload bashcompinit && bashcompinit
source $(brew --prefix)/etc/bash_completion.d/az

# --- The Fuck ---
eval $(thefuck --alias)

# --- Backups ---
alias backup="$HOME/.local/bin/backup.sh"

# --- GLOBAl ALIASES ---
alias reloadz="source ~/.zshrc"
alias editz="nvim ~/.zshrc"

alias ls='eza -lh --group-directories-first --icons=auto'
alias lsa='ls -a'
alias lt='eza --tree --level=2 --long --icons --git'
alias lta='lt -a'
alias ll='ls -alF'
alias ff="fzf --preview 'bat --style=numbers --color=always {}'"

alias cd="z"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias cr="coderabbit"

alias lazyalan='\
pn build && \
pn lint && \
pn typecheck && \
pn test\
'

alias dsclean='find . -type f -name ".DS_Store" -delete'

