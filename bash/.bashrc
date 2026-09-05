# ~/.bashrc

[[ $- != *i* ]] && return

#env variables 
export EDITOR="nvim"

#prompt
PS1="┌─ \[\e[0;34m\]\w\[\e[0m\]\n└─ \[\e[0;34m\]${USER}_${HOSTNAME}\[\e[0m\] ❯ "

#alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias dotsync='cd ~/arch-daemon-yanyan && git add . && git commit -m "sync configs" && git push && stow * && cd - >/dev/null'

# Device logic
if [ -n "$TERMUX_VERSION" ]; then
	echo "Native Termux hardware shell"
	
	#export
	export PULSE_SERVER="tcp:127.0.0.1:4713"
	export RISH_APPLICATION_ID="com.termux"
	export PATH="$PATH:/usr/bin/bsdgames"
	pulseaudio --start 2>/dev/null
	
	#alias
	alias cava="run-current-termux pulseaudio --start 2>/dev/null && command cava"

elif [ -f /etc/arch-release ]; then
	echo "Arch Linux Server Daemon"

else
	echo "Windows Dev Environment"
	alias phonedev='ssh u0_a234@192.168.1.50 -p 8022'
fi

# Startup commands
fastfetch
