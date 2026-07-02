export PATH=/opt/homebrew/bin:$PATH

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
