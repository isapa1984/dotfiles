#!/bin/sh

case "$1" in
    open)
        SWAY_COMMAND="workspace number"
        ;;
    move)
        SWAY_COMMAND="move container to workspace number"
        ;;
    *)
        echo "Opção Inválida. Use open ou move"
        exit
        ;;
esac

NEXT_WORKSPACE=$(swaymsg -t get_outputs -r | jq -r 'map(select(.focused == true).current_workspace).[0] | tonumber + 1')
# echo "Next Workspace: $NEXT_WORKSPACE"
# echo "Sway Command: $SWAY_COMMAND"
# echo "Full Sway Command: $SWAY_COMMAND $NEXT_WORKSPACE"
swaymsg "$SWAY_COMMAND $NEXT_WORKSPACE"