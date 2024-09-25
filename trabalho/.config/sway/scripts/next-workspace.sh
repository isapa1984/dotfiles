#!/bin/sh

NEXT_WORKSPACE=$(swaymsg -t get_outputs -r | jq -r 'map(select(.focused == true).current_workspace).[0] | tonumber + 1')

case "$1" in
    open)
        SWAY_COMMAND="workspace number $NEXT_WORKSPACE"
        ;;
    move)
        SWAY_COMMAND="move container to workspace number $NEXT_WORKSPACE; workspace number $NEXT_WORKSPACE"
        ;;
    *)
        echo "Opção Inválida. Use open ou move"
        exit
        ;;
esac

swaymsg "$SWAY_COMMAND"