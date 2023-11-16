#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

############################
## ALIASES                ##
############################

alias ls='ls --color=auto'
alias bashconf="vim ~/.bashrc"
alias kittyconf="vim ~/.config/kitty/kitty.conf"
alias update="sudo zypper dup && flatpak update && nix-env -u"

############################
## EXPORTS                ##
############################

export PATH="${PATH}:/home/clepnicx/.local/bin"             

###################################################################################################################
## COMMAND PROMPT                                                                                                ##
###################################################################################################################


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
