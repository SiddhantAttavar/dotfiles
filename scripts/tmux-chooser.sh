#!/usr/bin/bash
# shellcheck disable=SC2207

# Doesn't let you press Ctrl-C
function ctrl_c() {
	echo -e "\renter nil to drop to normal prompt"
}

trap ctrl_c SIGINT

no_of_terminals=$(tmux list-sessions | wc -l)
IFS=$'\n'
output=($(tmux list-sessions))
output_names=($(tmux list-sessions -F\#S))

k=1
echo "Choose the terminal to attach: "
for i in "${output[@]}"; do
	echo "$k - $i"
	((k++))
done
echo

echo "Create a new session by entering a name for it"

read -r input
if [[ $input == "" ]]; then
	tmux new-session
elif [[ $input == ' ' ]]; then
	zsh
elif [[ $input =~ ^[0-9]+$ ]] && [[ $input -le $no_of_terminals ]]; then
	terminal_name="${output_names[input - 1]}"
	tmux attach -t "$terminal_name"
else
	tmux new-session -s "$input"
fi

exit 0
