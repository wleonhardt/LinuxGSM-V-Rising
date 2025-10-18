#!/bin/bash
# LinuxGSM fix_vrserver.sh module
# Author: You
# Description: Ensures required config files are in the correct location for V Rising.

moduleselfname="$(basename "$(readlink -f "${BASH_SOURCE[0]}")")"

fixname="V Rising config setup"
fn_fix_msg_start

configsource="${configdir:-"${lgsmdir}/config-lgsm/${selfname}"}"
configtarget="${serverfiles}/save-data/Settings"

# Create target Settings directory if missing
mkdir -p "${configtarget}"

# Copy ServerHostSettings.json if missing
if [ ! -f "${configtarget}/ServerHostSettings.json" ]; then
	fn_print_info_nl "Copying ServerHostSettings.json"
	fn_script_log_info "Copying ServerHostSettings.json"
	cp -v "${configsource}/ServerHostSettings.json" "${configtarget}/ServerHostSettings.json"
fi

# Copy ServerGameSettings.json if missing
if [ ! -f "${configtarget}/ServerGameSettings.json" ]; then
	fn_print_info_nl "Copying ServerGameSettings.json"
	fn_script_log_info "Copying ServerGameSettings.json"
	cp -v "${configsource}/ServerGameSettings.json" "${configtarget}/ServerGameSettings.json"
fi

fn_fix_msg_end