#!/bin/sh

NEXT_WORKSPACE=$(swaymsg -r -t get_workspaces | jq -r --arg OUTPUT $(swaymsg -t get_outputs -r | jq -r '.[] | select(.focused == true) | .name') '(. | (max_by(.num) | .num)) as $max | [.[] | select(.output == $OUTPUT)] | (max_by(.num) | .num) as $maxOutput | (.[] | select(.focused == true) | .num) as $current | if $maxOutput > $current then "next_on_output" else $max + 1 end')
# echo $NEXT_WORKSPACE
swaymsg "move container to workspace $NEXT_WORKSPACE, workspace next_on_output"