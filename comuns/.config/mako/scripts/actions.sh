#!/bin/bash

case "$1" in
	show-history)
		# Do not show history with Do Not Disturb Mode Enabled
        if [[ ! "$(makoctl mode)" =~ "dnd" ]]; then
            makoctl restore
        fi        
		;;
	dismiss)
		makoctl dismiss -a
		;;
	toggle-dnd)
		makoctl mode -t dnd
		;;
esac

