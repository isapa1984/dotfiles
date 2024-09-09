#!/bin/sh

CURRENT_OUTPUT=$(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused == true) | .name')
NEW_WORKSPACE=$(swaymsg -r -t get_workspaces | jq -r --arg CURRENT_OUTPUT $CURRENT_OUTPUT 'map(select(.output == $CURRENT_OUTPUT).num) | max + 1')

# echo "Output: $CURRENT_OUTPUT"
# echo "New Workspace: $NEW_WORKSPACE"

swaymsg "move container to workspace number $NEW_WORKSPACE"