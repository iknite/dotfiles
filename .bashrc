# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Bash enhacements
for option in cdspell checkwinsize extglob globstar histappend nocaseglob; do
	shopt -s "$option" 2> /dev/null
done
unset option

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# modular conf for keep things simple. This loads all the files sorted,
# inside .dotfiles.d that follows the ??_* pattern. 
# examples: 00_paths 30_python_conf ZZ_top
for file in $(find $HOME/.dotfiles.d/ -name "??_*"); do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# show the improved prompt.
[ -r .bash_prompt ] && [ -f .bash_prompt ] && source .bash_prompt
