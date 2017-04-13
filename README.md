# **tmux-rtfm** #

Quickly open the man page of a command in a split or in the current window.
The commmand must be put in the paste-buffer by using the mouse to get a selection.

the plugin works by:
 

 1. saving the command name (the paste buffer content) into a temporary swap file then opening the "man" command with the contents of this file as input.   
 2. launching the "man" command with the content of the system clipboard as input (shift+mouse selection, xclip needed)

## Configuration ##

At the moment only three tunables are implemented:

    # swap file name
    set -g @rtfm_temp_file_name '/tmp/tmuxRTFM'
    # open man page in current window or in a split
    set -g @rtfm_open_in_split 'yes'
    # set mode: swap or xclip.
    # 'swap' uses a swapfile in /tmp to keep track of the last command
    # 'xclip' uses the system clipboard to store the command (shift+mouse selection)
    set -g @rtfm_clip_mpde 'xclip'

to install the plugin, use tmux-plugins/tpm:

    set -g @plugins 'mcaimi/tmux-rtfm'



