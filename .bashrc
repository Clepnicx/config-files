#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

############################
## EXPORTS                ##
############################

export PATH="${PATH}:/home/clepnicx/.local/bin"             


###################################################################################################################
## COMMAND PROMPT                                                                                                ##
###################################################################################################################

# get CPU usage
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

command_prompt () {

    local LAST_COMMAND=$?

    ##
    ## DEFINE COLORS
    ##
    local LIGHTGRAY="\033[0;37m"
    local WHITE="\033[1;37m"
    local BLACK="\033[0;30m"
    local DARKGRAY="\033[1;30m"
    local RED="\033[0;31m"
    local LIGHTRED="\033[1;31m"
    local GREEN="\033[0;32m"
    local LIGHTGREEN="\033[1;32m"
    local BROWN="\033[0;33m"
    local YELLOW="\033[1;33m"
    local BLUE="\033[0;34m"
    local LIGHTBLUE="\033[1;34m"
    local MAGENTA="\033[0;35m"
    local LIGHTMAGENTA="\033[1;35m"
    local CYAN="\033[0;36m"
    local LIGHTCYAN="\033[1;36m"
    local URGENTRED="\033[38;5;196m"
    local PURPLE="\033[38;5;171m"
    local SALMON="\033[38;5;209m"
    local DARKORANGE="\033[38;5;208m"
    local NOCOLOR="\033[0m"

    ##
    ## DEFINE PROMPT VARIABLES
    ##
    local DAY="$(date +%a)"
    local DATE="$(date +%b-'%-d')"
    local TIME="$(date +'%-I':%M:%S%P)"
    local CPU="$(cpu)%"
    local JOBS="\j"
    local ICON="λ"

    ## Display a happy smiley if the exitcode is 0, else display a shocked smiley
    if [[ $LAST_COMMAND != 0 ]]; then
        local SYMBOL="\[${RED}\]\[${ICON}\]"
    else
        local SYMBOL="\[${SALMON}\]\[${ICON}\]"
    fi

    ##
    ## DEFINE PROMPT
    ##

    ### First line of the prompt

    ## Right side of the prompt
    # Status of the exitcode (Smiley) + Day + Time
    local RIGHT_SIDE="\[${LIGHTGRAY}\](${SYMBOL}\[${LIGHTGRAY}\])-(\[${BLUE}\]${DAY} ${DATE} \[${PURPLE}\]${TIME}\[${LIGHTGRAY}\])"

    # Save curser position, move curser to the right side, print Right_Side and restore curser position.
    PS1="\[$(tput sc; printf "%*s" $(($COLUMNS+92)) "${RIGHT_SIDE}"; tput rc)\]"

    ## Left side of the prompt
    # User + Hostname
    PS1+="\[${LIGHTGRAY}\](\[${DARKORANGE}\]\u\[${BLUE}\]@\[${PURPLE}\]\h"

    # Current directory
    PS1+="\[${LIGHTGRAY}\]:\[${CYAN}\]\w\[${LIGHTGRAY}\])"

    ### Second line of the prompt
    # Skip to the next line
    PS1+="\n"

    # display ">>>"
    PS1+="\[${BLUE}\]>\[${PURPLE}\]>\[${SALMON}\]>\[${NOCOLOR}\] "


}
PROMPT_COMMAND="command_prompt"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
