# zsh enhancement
setopt histignorealldups sharehistory

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# update fpath to understand for dotfile repository
fpath=( "$HOME/.zsh/functions" $fpath )

# modular conf for keep things simple. This loads all the files sorted,
# inside .dotfiles.d that follows the ??_* pattern. 
# examples: 00_paths 30_python_conf ZZ_top
for file in ~/.dotfiles/??_*; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

## enable the pure zsh prompt
autoload -U promptinit && promptinit
PURE_CMD_MAX_EXEC_TIME=1
prompt pure
