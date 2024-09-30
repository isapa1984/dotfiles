#!/bin/sh

OUTPUT_DIR="$HOME/Vídeos/Gravações de tela"

OPTSTRING="se"

while getopts ${OPTSTRING} opt; do
	case ${opt} in
		s)
			wf-recorder -g "$(slurp)" -f $OUTPUT_DIR/recording_$(date +"%d-%m-%Y_%H:%M:%S.mp4")
			;;
		e)
			pkill wf-recorder
			;;
		*)
			echo "Opção Inválida"
			;;
	esac
done