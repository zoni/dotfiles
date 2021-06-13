#!/bin/zsh

get_workspace_name() {
	local workspace=$1
	if [ ! $(grep --silent --fixed-strings "set \$tag${workspace} " "$HOME/.i3/config") ]; then
		sed -nre "s/set \\\$tag${workspace} \"(.+)\"/\1/p" $HOME/.i3/config
	else
		echo $workspace
	fi
}

for i in {1..20}; do
	local workspace=$(get_workspace_name $i)
	test -e "$HOME/.i3/workspace-$i.json" && i3-msg "workspace $workspace; append_layout $HOME/.i3/workspace-$i.json"
done

i3-msg "workspace $(get_workspace_name 1)"
