# utils.sh
# file and config utility aliases

alias open="xdg-open"
alias t="todo.sh"
alias jb="jobs"

# cd into new dir
mkcd () {
	mkdir -p -- "$1" && cd -P -- "$1"
}

# print full path to file
pwf () {
	echo $(pwd)/$1
}

# auto attach or create tmux session
tm() {
	tmux attach -t $1 || tmux new -s $1
}

# swap two files, renaming one to the other
swap() {
	tmp=`mktemp`
	mv $1 $tmp
	mv $2 $1
	mv $tmp $2
}

# repeat a command N times
function repeat() {
	number = $1
	shift
	for n in $(seq $number); do
		$@
	done
}

# fuzzy open file
# tweaked from https://github.com/junegunn/fzf/wiki/examples#opening-files
fo() {
	# fzf over non-hidden files in home dir
  IFS=$'\n' out=("$(find ~/* -not -path '*/.*' | fzf --query="$1" --exit-0 --expect=ctrl-e,ctrl-o)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)

  if [ -n "$file" ]; then
		# ctrl-e to open in $EDITOR, ctrl-o or enter to xdg-open
		[ "$key" = ctrl-e ] && ${EDITOR:-vim} "$file" || xdg-open "$file"
  fi
}
