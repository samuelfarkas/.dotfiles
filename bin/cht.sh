#!/usr/bin/env bash

languages=$(echo "golang c cpp typescript rust javascript" | tr " " "\n")
core_utils=$(echo "find xargs sed awk grep" | tr " " "\n")
selected=$(echo -e "$languages\n$core_utils" | fzf)

if [[ -z $selected ]]; then
    exit 0
fi

read -p "Search query: " query

if echo "$languages" | grep -qs $selected; then
    tmux neww bash -c "curl cht.sh/$selected/$(echo "$query" | tr " " "+") | less"
else
    tmux neww bash -c "curl cht.sh/$selected~$query | less"
fi

