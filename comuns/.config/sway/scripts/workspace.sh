#!/bin/sh

if [[ -z "$1" ]] || [[ -z "$2" ]]; then
    echo "Opções Inválidas"
    echo "Uso: workspace.sh (open|move) (prev|next)"
    exit 0
fi

CURRENT_WS=$(swaymsg -t get_outputs -r | jq -r 'map(select(.focused == true).current_workspace).[0] | tonumber')

DIRECTION=$2
case "$DIRECTION" in
    next)
        TARGET_WS=$(($CURRENT_WS + 1))
        ;;
    prev)
        if [[ $CURRENT_WS -gt 1 ]]; then
            TARGET_WS=$(($CURRENT_WS - 1))            
        fi
        ;;
esac

COMMAND=$1
case "$COMMAND" in
    open)        
        SWAY_COMMAND="workspace number $TARGET_WS"
        ;;
    move)
        SWAY_COMMAND="move container to workspace number $TARGET_WS; workspace number $TARGET_WS"
        ;;
    *)
        echo "Opção Inválida. Use open ou move"
        exit
        ;;
esac

swaymsg "$SWAY_COMMAND"