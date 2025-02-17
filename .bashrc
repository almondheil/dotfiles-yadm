

# John David Stone, Bazil Mupisiri, Alex French, Reilly Grant, Logan Goldberg
# Department of Computer Science
# Grinnell College
# stone@cs.grinnell.edu, mupisiri@grinnell.edu, frenchal17@grinnell.edu,
#  grantrei@grinnell.edu, goldberg@grinnell.edu

# created August 23, 1999
# last revised by Mike Conner Sept. 22, 2017

# Exit immediately if the shell is not interactive.

[ -z "$PS1" ] && return

export PS1='\[\e[90m\][\t]\[\e[0m\] \[\e[92m\]\H\[\e[0m\] \[\e[95m\]\w\[\e[0m\] \\$ '

# Notify the user as soon as a background job is completed.

set -o notify

# Avoid accidental overwriting of files.

set -o noclobber

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# Ensure that spawned shells know the values of critical environment
# variables.

export PS1 PS2


##########################################################################
###### --- CSC-151 Students: put your customizations below this --- ######
##########################################################################



##########################################################################
###### --- CSC-161 Students: put your customizations below this --- ######
##########################################################################

# Make MyroC libraries known to the execution environment
LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/home/walker/MyroC/lib"

export LD_LIBRARY_PATH

##########################################################################
###### --- CSC-207 Students: put your customizations below this --- ######
##########################################################################



##########################################################################
#### --- CSC-321-322 Students: put your customizations below this --- ####
##########################################################################

# lmao when were these course numbers common

######################################################################
######### --- Place all other customizations below this --- ##########
######################################################################

# Set umask to make new files not be globally readable
# 077 means "take no permissions away from user. take all away from group and other"
umask 077

# Include cross-shell aliases
for file in $HOME/.alias.d/*.sh; do
	source "$file"
done

# set PATH appropriately on mathLAN
export PATH="$PATH:$HOME/.local/bin:$HOME/.local/scripts:/usr/local/cuda/bin"

# z - jump around
. $HOME/.z.sh

# explicitly setting terminal to xterm 256color makes backspace move left, not right.
# why is this a setting I had to set? wacky
export TERM=xterm-256color
