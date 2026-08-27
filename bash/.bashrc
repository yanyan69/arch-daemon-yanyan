#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#execute on boot
fastfetch
pulseaudio --start --exit-idle-time=-1 2>/dev/null
#custom terminal
PS1="┌─ \[\e[0;34m\]\w\[\e[0m\]\n└─ \[\e[0;34m\]yanyan67_archlinux\[\e[0m\] ❯ "

export PATH="$PATH:/usr/bin/bsdgames"
export EDITOR="nvim"
export PULSE_SERVER="tcp:127.0.0.1:4713"
#alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias cava="run-current-termux pulseaudio --start 2>/dev/null && command cava"
alias dotsync='cd ~/arch-daemon && git add . && git commit -m "sync configs" && git push && stow * && cd ~'
#device, env logic
if [ -n "$TERMUX_VERSION" ]; then
    # --- THIS BLOCK ONLY RUNS IN NATIVE TERMUX ---
    echo "Native Termux hardware shell"
    alias arch="bash ~/.shortcuts/launch_arch.sh"
    pulseaudio --start 2>/dev/null

elif [ -f /etc/arch-release ]; then
    # --- THIS BLOCK ONLY RUNS INSIDE ARCH LINUX ---
    echo "Arch Linux Server Daemon"

else
    # --- THIS BLOCK RUNS ON YOUR WINDOWS PC (GIT BASH) ---
    alias phonedev='ssh u0_a234@192.168.1.50 -p 8022'
    echo "Windows Dev Environment"
fi
