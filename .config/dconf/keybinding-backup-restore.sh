#!/bin/bash

input="$1"
config_filename="${2:-custom-keybindings.dconf}"
dconf_path="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/"

case $input in
	backup|b)
		echo "saving dconf custom keybinding configuration to: ${config_filename}"
		dconf dump "${dconf_path}" > "${config_filename}"
		;;
	restore|r)
		echo "loading dconf custom keybinding configuration from: ${config_filename}"
		dconf load "${dconf_path}" < "${config_filename}"
		;;
	*)
		echo "USAGE: $0 backup|restore [filename]"
		;;
esac
