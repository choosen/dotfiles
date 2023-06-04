# export GPG_TTY=$TTY
export GPG_TTY=$(tty)
export RUBY_DEBUG_EDITOR=code
# export RUBYOPT='--disable-did_you_mean'
# DOCKER_DEFAULT_PLATFORM=linux/amd64

# alias cat=bat

export TEST_VERBOSITY=0

# Use asdf local ruby instead of rbenv

export PATH="/opt/homebrew/bin:$PATH"

# brew install asdf
# source /opt/homebrew/opt/asdf/libexec/asdf.sh #
source $(brew --prefix asdf)/libexec/asdf.sh
# unset ASDF_DIR

# starship
# eval "$(starship init zsh)"

# OhMyPosh
export ITERM2_SQUELCH_MARK=1
eval "$(oh-my-posh init zsh --config ~/config/.ohmyposh/mytheme.omp.yaml)"

# if [[ ! -f ~/.zpm/zpm.zsh ]]; then
#     git clone --recursive https://github.com/zpm-zsh/zpm ~/.zpm
# fi

# source ~/.zpm/zpm.zsh

# zpm load @omz
# zpm load zpm-zsh/ls
# zpm load @omz/git @omz/bundler
# zpm load @omz/z \
#           @omz/rails \
#           @omz/git \
#           @omz-lib/key-bindings \
#           @omz-lib/completion \
# 	  @omz/zsh-users/zsh-syntax-highlighting

# those not typeprof disabled:
####          @omz/asdf \
#          @omz/ag
#          @omz/heroku \

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

export NVM_DIR=~/.nvm
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BAT_PAGER=" less -RFX --raw-control-chars"

alias zshcfg="nano /Users/piotrwasiak/.zshrc"
alias gitcfg="nano ~/.gitconfig"

# alias be='bundle exec'

# creds

source ~/.creds

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# brew install zsh-autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# brew install z
source /opt/homebrew/etc/profile.d/z.sh


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