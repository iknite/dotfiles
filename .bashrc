# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)

# If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Bash enhacements
for option in autocd cdspell checkwinsize globstar histappend nocaseglob; do
	shopt -s "$option" 2> /dev/null
done
unset option

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# if We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	PS1='${debian_chroot:+($debian_chroot)}\[\e[38;5;148m\]\u\[\e[00m\]'
	PS1+='\[\e[38;5;149m\]@\[\e[00m\]'
	PS1+='\[\e[38;5;150m\]\h\[\e[00m\]'
	PS1+=' \[\e[00;36m\]\w\[\e[00m\]'
	PS1+='$(git_ps1)$(git_dirty)'
	PS1+=' \[\e[38;5;105m\]❯\[\e[00m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \W'
	PS1+='$(git_ps1)$(git_dirty)'
	PS1+=' ❯ '
fi 

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

## modular conf for keep things simple. 
## extra is for override the repository settings
for file in ~/.{paths,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

. /usr/local/bin/virtualenvwrapper.sh
