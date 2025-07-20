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
if [ -e "/usr/bin/nvim" ]
then
	alias vim='/bin/nvim'
fi
alias ghidra='_JAVA_AWT_WM_NONREPARENTING=1 ghidra'

# OSC-7 escape sequence configuration
# allows spawning new terminal instances in cwd
osc7_cwd()
{
	local strlen=${#PWD}
	local encoded=""
	local pos c o
	for (( pos=0; pos<strlen; pos++ )); do
		c=${PWD:$pos:1}
		case "$c" in
			[-/:_.!\'\(\)~[:alnum:]] ) o="${c}" ;;
			* ) printf -v o '%%%02X' "'${c}" ;;
		esac
		encoded+="${o}"
	done
	printf '\e]7;file://%s%s\e\\' "${HOSTNAME}" "${encoded}"
}

PROMPT_COMMAND=${PROMPT_COMMAND:+${PROMPT_COMMAND%;}; }osc7_cwd

# console prompt config
cyan="\[$(tput setaf 43)\]"
blue="\[$(tput setaf 51)\]"
pink="\[$(tput setaf 13)\]"
green="\[$(tput setaf 46)\]"
none="\[$(tput sgr0)\]"

source "/usr/share/git/git-prompt.sh"

PS1="[${pink}\A${none}] ${green}\u@\h${cyan}\$(__git_ps1)\n${none}(${blue}\w${none})\$ "

# update sdl controller mappings
if [ -e "${HOME}/.gamecontrollerdb" ]
then
	SDL_GAMECONTROLLERCONFIG=$(cat ${HOME}/.gamecontrollerdb)
fi

# custom completion
if [ -e "/usr/share/bash-completion/completions/git" ]
then
	source /usr/share/bash-completion/completions/git
	__git_complete dotfiles __git_main
fi

complete -W "underground binary cfged car-toolkit" nfs-run
complete -W "voxedit voxconvert voxconvertui thumbnailer build" vengi

# pyenv setup
if [ -n "$(which pyenv)" ]
then
	export PYENV_ROOT="$HOME/.pyenv"
	command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
fi
