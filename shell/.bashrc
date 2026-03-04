#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

eval "$(fzf --bash)"
eval "$(starship init bash)"

# Aliases
alias grep='grep --color=auto'
alias ls="lsd"
alias la="lsd -a"
alias ll="lsd -l"
alias lla="lsd -la"
alias lt="lsd --tree"
alias top="htop"
alias btop="btop --force-utf"
alias i="sudo pacman -S"
alias iy="paru -S"
alias s="pacman -Ss"
alias sy="paru -Ss"
alias q="pacman -Qs"
alias r="sudo pacman -R"
alias ra="sudo pacman -Rns"

# Functions
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
