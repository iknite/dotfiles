export PATH=/opt/homebrew/bin:$HOME/bin:$PATH

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# mise-en-place
eval "$(mise activate zsh)" # this sets up interactive sessions
