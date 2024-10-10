#!/bin/bash

readonly ENABLED=" "
readonly DISABLED=" "
readonly DISABLED_UNREAD="!"

BAR_ITEM=$ENABLED

if [[ "$(makoctl mode)" =~ "dnd" ]]; then
	UNREAD_COUNT=$(makoctl list | jq -e '.data[] | length')
	if [ $UNREAD_COUNT -eq 0 ]; then
		BAR_ITEM=$DISABLED
	else
		BAR_ITEM=$DISABLED_UNREAD
	fi
fi

echo "$BAR_ITEM"

# Atualiza o modulo via SIGNALS
pkill --signal SIGRTMIN+1 waybar