# Use asdf local ruby instead of rbenv

source ~/.exports

# brew install asdf
# source /opt/homebrew/opt/asdf/libexec/asdf.sh #
source $(brew --prefix asdf)/libexec/asdf.sh
# unset ASDF_DIR

# brew install starship
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#     source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export POWERLEVEL9K_SHORTEN_DIR_LENGTH=7
export POWERLEVEL9K_SHORTEN_STRATEGY=truncate_from_right
export POWERLEVEL9K_SHORTEN_DELIMITER=.*
export POWERLEVEL9K_CHANGESET_HASH_LENGTH=18
export HIST_STAMPS="yyyy.mm.dd"

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# creds

source ~/.creds

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# zoxide (z replacement)
eval "$(zoxide init zsh)"


# brew install zsh-completions
# activate completions (example: >git `tab`  or  >git -`tab`):
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    # -i ignores not root and not current user files, skips question
    compinit -i
fi

# You may also need to force rebuild `zcompdump`:
#   rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:

#   chmod -R go-w '/opt/homebrew/share/zsh'

# integrate fzf with zsh.
# CTRL + R (better history), CTRL + T (select file to choose instead of ** + TAB), ESC + C (fzf directories passed to cd)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source ~/.aliases

# Cursor is a Block:
# echo -e -n "\x1b[\x31 q" # Blinking
# echo -e -n "\x1b[\x32 q" # Steady

# Cursor is a underscore
echo -e -n "\x1b[\x33 q"
# Blinking
# echo -e -n "\x1b[\x34 q" # Steady

# Cursor is a vertical line
# echo -e -n "\x1b[\x35 q" # Blinking
# echo -e -n "\x1b[\x36 q" # Steady
