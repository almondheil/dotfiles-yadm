# env.zsh
# environment config

# tell zsh to look for zfunc directory (completions)
fpath+=~/.zfunc

# Set XDG config home for programs to find
export XDG_CONFIG_HOME=$HOME/.config

# Set $TERM
export TERM=xterm-256color

# Make sure gpg works...? I didn't need this in the past
export GPG_TTY=$(tty)

# set SSH socket to use gnome-keyring-daemon
export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

# Defaults for various terminal settings
export EDITOR=nvim

# Don't initialize less if there's less than a screen
export LESS="--no-init --quit-if-one-screen -R"

# Set PATH to include important stuff
DESIRED_PATH="$HOME/.local/bin:$HOME/.cargo/bin:$HOME/.local/script:$HOME/.ghcup/bin:$HOME/.gems/bin:$HOME/.local/share/gem/ruby/3.0.0/bin"
if ! [[ "$PATH" =~ $DESIRED_PATH ]]; then
	export PATH="$PATH:$DESIRED_PATH"
fi

# Make man display with bat if we have it installed
if command -v bat > /dev/null
then
	export MANPAGER="sh -c 'col -bx | bat -p -l man'"
	man()
	{
		command man "$@" | eval ${MANPAGER}
	}
fi

# Set up thefuck, which can correct commands
if command -v thefuck > /dev/null
then
	eval $(thefuck --alias)
fi
