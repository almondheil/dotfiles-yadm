# Link .ghcup environment if installed
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# Make perl included in path
PATH="/home/almond/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/almond/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/almond/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/almond/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/almond/perl5"; export PERL_MM_OPT;

# Set ruby gem install location
export GEM_HOME=$HOME/.gems

# Source cargo environment
if test -f "$HOME/.cargo/env"; then
	. "$HOME/.cargo/env"
fi

# Conda, originally created by conda-init but now out of its reach
__conda_setup="$('/home/almond/.miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/almond/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/almond/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/almond/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
