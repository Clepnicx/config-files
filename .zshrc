#
# ~/.zshrc
#

############################
## EXPORTS                ##
############################

export PATH="${PATH}:/home/clepnicx/.local/bin"


###########################
## ALIASES               ##
###########################

alias zshconf="vim ~/.zshrc"
alias kittyconf="vim ~/.config/kitty/kitty.conf"

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
