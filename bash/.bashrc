#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#execute on boot
fastfetch

#custom terminal
PS1="┌─ \[\e[0;34m\]\w\[\e[0m\]\n└─ \[\e[0;34m\]yanyan67_archlinux\[\e[0m\] ❯ "

export PATH="$PATH:/usr/bin/bsdgames"
export EDITOR="nvim"

#alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'

#alias for mpd
music-on() {
        echo "Cleaning up old sessions..."
        killall -9 mpd pulseaudio 2>/dev/null
        
        echo "Initiating Pulse Audio Server (via Safe Wrapper)..."
        # We use the official script wrapper to prevent the tagged pointer crash
        
	export PULSE_SERVER=127.0.0.1
	pulse-daemon.sh start 2>/dev/null
        
        echo "Launching Music Player Daemon..."
        mpd ~/.config/mpd/mpd.conf 2>/dev/null
        
        echo "Updating music library..."
        mpc update >/dev/null 2>&1
        
        echo "Opening Music Player..."
        sleep 0.5
        ncmpcpp
}

music-off() {
        echo "Shutting Down Music Player Daemon..."
        killall -9 mpd 2>/dev/null
        echo "Killing Pulse Audio Server..."
        pulse-daemon.sh stop 2>/dev/null
        echo "Done"
}

alias cava="run-current-termux pulseaudio --start 2>/dev/null && command cava"

# 2. DEVICE & ENVIRONMENT LOGIC
if [ -n "$TERMUX_VERSION" ]; then
    # --- THIS BLOCK ONLY RUNS IN NATIVE TERMUX ---
    echo "Welcome to Native Termux hardware shell!"

elif [ -f /etc/arch-release ]; then
    # --- THIS BLOCK ONLY RUNS INSIDE ARCH LINUX ---
    echo "Welcome to your Arch Linux Server Daemon!"

else
    # --- THIS BLOCK RUNS ON YOUR WINDOWS PC (GIT BASH) ---
    alias phonedev='ssh u0_a234@192.168.1.50 -p 8022'
    echo "Welcome back to your Windows Dev Environment!"
fi
