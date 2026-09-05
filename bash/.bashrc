# ~/.bashrc

# Interactive shell check
[[ $- != *i* ]] && return

# Environment variables
export EDITOR="nvim"
export PULSE_SERVER="tcp:127.0.0.1:4713"

# Path additions
export PATH="$PATH:/usr/bin/bsdgames"

# Prompt
PS1="┌─ \[\e[0;34m\]\w\[\e[0m\]\n└─ \[\e[0;34m\]username_archlinux\[\e[0m\] ❯ "

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cava="run-current-termux pulseaudio --start 2>/dev/null && command cava"
alias dotsync='cd ~/arch-daemon-yanyan && git add . && git commit -m "sync configs" && git push && stow * && cd - >/dev/null'

# Device logic
if [ -n "$TERMUX_VERSION" ]; then
    echo "Native Termux hardware shell"
    alias arch="bash ~/.shortcuts/launch_arch.sh"
    pulseaudio --start 2>/dev/null

elif [ -f /etc/arch-release ]; then
    echo "Arch Linux Server Daemon"

else
    echo "Windows Dev Environment"
    alias phonedev='ssh u0_a234@192.168.1.50 -p 8022'
fi

# Startup commands
fastfetch
export RISH_APPLICATION_ID="com.termux"
