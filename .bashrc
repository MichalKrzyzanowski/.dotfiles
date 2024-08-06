#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# add .local/bin to path
PATH="~/.local/bin/:"$PATH
# colors
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# aliases
if [ -e "usr/bin/nvim" ]
then
	alias vim='/bin/nvim'
fi
alias ghidra='_JAVA_AWT_WM_NONREPARENTING=1 ghidra'

# console prompt config
PS1='(\[\033[1;32m\]\u@\h\[\033[1;34m\] \W\[\033[0m\])\$ '

# update sdl controller mappings
SDL_GAMECONTROLLERCONFIG=$(cat ~/gamepad-db/.controller_config)

# custom completion
complete -W "underground binary cfged car-toolkit" nfs-run
complete -W "voxedit voxconvert voxconvertui thumbnailer build" vengi
