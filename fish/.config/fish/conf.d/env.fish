# XDG Paths as per the specification:
# https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
set -gx XDG_CONFIG_HOME $HOME/.config

# Other
set -gx DOTFILES $HOME/.dotfiles
set -gx CDPATH ".:$HOME:$XDG_PERSONAL_DIR:$XDG_WORK_DIR:$XDG_DOCUMENTS_DIR:$XDG_DOWNLOADS_DIR:$XDG_IDEAS_DIR"
set -gx EDITOR nvim
set -gx TERMINAL ghostty
set -gx SSH_AUTH_SOCK $HOME/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

set -gx CLIPBOARD pbcopy
set -gx PASTEBOARD pbcopy

# add homebrew paths to the beginning of PATH
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH /opt/homebrew/sbin $PATH

# add user bin
set -gx PATH $HOME/bin $PATH
set -gx PATH $HOME/.local/bin $PATH
set -gx PATH $HOME/opt/bin $PATH

# set go paths
# set -gx GOPATH $HOME/go
# set -gx PATH $GOPATH/bin $PATH

# set python paths
# set -gx PATH $HOME/Library/Python/3.12/bin $PATH

# Gnu-Sed
set -gx PATH /opt/homebrew/opt/gnu-sed/libexec/gnubin $PATH

# set variables for Terraform
set -gx ARM_USE_AZUREAD true
set -gx ARM_STORAGE_USE_AZURE_AD true
