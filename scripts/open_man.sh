#!/bin/bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $CURRENT_DIR/variables.sh
source $CURRENT_DIR/helpers.sh

function prepare_man_cmd() {
  TMUX_RTFM_SPLIT="$(get_tmux_option "$rtfm_open_in_split")"
  CLIP_MODE="$(get_tmux_option "$rtfm_clip_mode")"
  # must we use a swap file?
  case $CLIP_MODE in
    "swap")
      TMUX_RTFM_TEMP="$(get_tmux_option "$rtfm_temp_file_name")"
      [[ ! -e $TMUX_RTFM_TEMP ]] && (touch $TMUX_RTFM_TEMP; tmux display-message "TMUX temp buffer ($TMUX_RTFM_TEMP) created.")
      tmux saveb $TMUX_RTFM_TEMP
      SHELLCMD="man $(cat $TMUX_RTFM_TEMP)"
      ;;
    "xclip")
      SHELLCMD="man $(xclip -o)"
      ;;
    *)
      tmux display-message "tmux-rtfm unsupported mode"
      exit
      ;;
  esac

  if [ "$TMUX_RTFM_SPLIT" == "yes" ]; then
    tmux split-window -h -p 30 $SHELLCMD
  else
    tmux run-shell "$SHELLCMD"
  fi
}

function main() {
  prepare_man_cmd
}

main
