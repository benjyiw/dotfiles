#!/bin/bash

input="$1"
config_filename="${2:-custom-keyrepeat.dconf}"
dconf_path="/org/gnome/desktop/peripherals/keyboard/"

case $input in
	backup|b)
		echo "saving dconf custom keyrepeat configuration to: ${config_filename}"
		dconf dump "${dconf_path}" > "${config_filename}"
		;;
	restore|r)
		echo "loading dconf custom keyrepeat configuration from: ${config_filename}"
		dconf load "${dconf_path}" < "${config_filename}"
		;;
	*)
		echo "USAGE: $0 backup|restore [filename]"
		;;
esac
