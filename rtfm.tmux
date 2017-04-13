#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $CURRENT_DIR/scripts/variables.sh
source $CURRENT_DIR/scripts/helpers.sh

function set_rtfm_invoke_bindings() {
  # bind RTFM command
  tmux bind-key m run-shell "$CURRENT_DIR/open_man.sh"
}

function main() {
  # set default variables
  set_tmux_option "@rtfm_temp_file_name_default" "$rtfm_temp_file_name_default"
  set_tmux_option "@rtfm_open_in_split_default" "$rtfm_open_in_split_default"
  set_tmux_option "@rtfm_clip_mode_default" "$rtfm_clip_mode_default"

  set_rtfm_invoke_bindings
}

main

