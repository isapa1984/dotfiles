#!/bin/sh

# case "$1" in
#     next)
#         WORKSPACE=$(swaymsg -t get_outputs -r | jq -r 'map(select(.focused == true).current_workspace).[0] | tonumber + 1')
#         ;;
#     prev)
#         WORKSPACE=$(swaymsg -t get_outputs -r | jq -r 'ma(select(.focused == true).current_workspace).[0] | tonumber as $ws | if $ws < 1 then 1 else $ws end')
#         ;;
#     *)
#         echo "Opção Inválida. Use next ou prev"
#         exit
#         ;;
# esac

WORKSPACE=$(swaymsg -t get_outputs -r | jq -r 'map(select(.focused == true).current_workspace).[0] | tonumber + 1')
# echo "Workspace: $WORKSPACE"

swaymsg "move container to workspace number $WORKSPACE"