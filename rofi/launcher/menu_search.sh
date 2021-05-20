#!/usr/bin/env bash

search_query=$( (echo) | rofi -dmenu -show drun -theme ~/dotfiles/rofi/launcher/web_search.rasi -p "Search query?")

if [[ -n "$search_query" ]]; then
    firefox --search "$search_query"
fi
exit
