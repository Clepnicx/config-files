#
# ~/.zshrc
#

############################
## EXPORTS                ##
############################

export HISTSIZE=20000
export PATH="${PATH}:/home/clepnicx/.local/bin"


###########################
## ALIASES               ##
###########################

alias zshconf="micro ~/.zshrc"
alias kittyconf="micro ~/.config/kitty/kitty.conf"

######################
## PLUGINS          ##
######################

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath=(~/.zsh/plugins/zsh-completions/src $fpath)

##############
## PROMPT   ##
##############
eval "$(starship init zsh)"
