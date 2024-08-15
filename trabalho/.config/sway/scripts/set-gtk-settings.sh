#!/bin/sh

OPTSTRING="t:i:c:f:"

while getopts ${OPTSTRING} opt; do
	case ${opt} in
		t)
			gtk_theme=$OPTARG
			;;
		i)
			icon_theme=$OPTARG
			;;
		c)
			cursor_theme=$OPTARG
			;;
		f)
			font_name=$OPTARG
			;;
	esac
done

# Setting Dconf settings

gnome_schema="org.gnome.desktop.interface"

gsettings set "$gnome_schema" gtk-theme "$gtk_theme"
gsettings set "$gnome_schema" icon-theme "$icon_theme"
gsettings set "$gnome_schema" cursor-theme "$cursor_theme"
gsettings set "$gnome_schema" font-name "$font_name"
gsettings set "$gnome_schema" color-scheme 'prefer-dark'

# Updating GTK3 settings.ini 

GTK3_SETTINGS=$(
	cat <<- SETTINGS
	[Settings]
	gtk-theme-name=$gtk_theme
	gtk-icon-theme-name=$icon_theme
	gtk-cursor-theme-name=$cursor_theme
	gtk-font-name=$font_name
	gtk-application-prefer-dark-theme=true
	SETTINGS
)

echo "$GTK3_SETTINGS" > $HOME/.config/gtk-3.0/settings.ini

