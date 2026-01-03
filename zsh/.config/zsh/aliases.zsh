#
# aliases - Zsh and bash aliases
#

# Open Machine configuration dir in editor.
alias cfg="nvim $XDG_PULSTAR_DIR"


# -----------------------------------------------------------------------------
# SYSTEM ACTIONS
# -----------------------------------------------------------------------------

# Shortcut to sudo.
alias _="sudo"

# Clear the screen.
alias c="clear"

# Show history.
alias h="history"

# Open neovim.
alias n="nvim"

# Use Neovim instead of Vim.
alias vi="nvim"

# Print PATH on spearate lines.
alias ep="echo "$PATH" | tr ':' '\n' | sort"

# Reload Zsh configuration.
alias rz="source ~/.zshrc"

# Ping with 5 packets.
alias ping="ping -c 5"

# Grep with colors and exclude common directories.
alias grep="command grep --exclude-dir={.git,.svn,.hg,.bzr,.vscode,.next,.node_modules} --color=auto"



# -----------------------------------------------------------------------------
# DIRECTORY ACTIONS
# -----------------------------------------------------------------------------

# Create also parent dirs.
alias md="mkdir -p"

# Show all attributes except permissions and user and group by directory first.
alias l="eza -lah --no-permissions --no-user --icons --group-directories-first"

# Show all attributes and group by directory first.
alias la="eza -lah --icons --group-directories-first"

# Show only directories.
alias ld="eza -lah --icons -d */"

# Show tree view 2 levels deep and exclude any .git directory.
alias lt="eza --tree --level=2 --long --icons --git"

# Show tree view excluding any .git directory and group by directories first.
alias lta="eza -lah --tree --no-permissions --no-user --icons --group-directories-first"

# Show directories in current directory.
alias "."="cd && ld"

# Goto parent directory and show directories.
alias ".."="cd .. && ld"

# Goto parent of parent directory and show directories.
alias "...."="cd ../.. && ld"

# Goto work directory.
alias cdw="cd $XDG_WORK_DIR"

# Got to work repositories directory.
alias cdwr="cd $XDG_WORK_REPOS_DIR"

# Goto personal directory.
alias cdp="cd $XDG_PERSONAL_DIR"

# Goto personal repositories directory.
alias cdpr="cd $XDG_PERSONAL_REPOS_DIR"

# Goto downloads directory.
alias cddown="cd $XDG_DOWNLOAD_DIR"

# Goto documents directory.
alias cddocs="cd $XDG_DOCUMENTS_DIR"

# Goto ideas directory.
alias cdideas="cd $XDG_IDEAS_DIR"

# Goto pulstar directory.
alias cdpulstar="cd $XDG_PULSTAR_DIR"


# -----------------------------------------------------------------------------
# DIRECTORY ACTIONS
# -----------------------------------------------------------------------------

# Remove directories and files without confirmation.
alias rmf="rm -rdf"

# Use bat instead of cat.
alias cat="bat"


# -----------------------------------------------------------------------------
# DOCKER/PODMAN ACTIONS
# -----------------------------------------------------------------------------

# alias docker="podman"


# -----------------------------------------------------------------------------
# DOTFILES ACTIONS
# -----------------------------------------------------------------------------

# Open dotfiles direcotiry in editor.
alias cfgdotfiles="nvim $XDG_PULLSTAR_DIR && pushd $XDG_PULSTAR_DIR"

# Quick edit of Aerospace configuration.
alias cfgaerospace="nvim $XDG_PULSTAR_DIR/roles/aerospace/files/aerospace.toml"

# Quick edit of Layzim configuration.
alias cfgnvim="nvim $XDG_PULSTAR_DIR/nvim/lua/config/lazy.lua"

# Quick edit of Ghostty configuration.
alias cfgwezterm="nvim $XDG_PULSTAR_DIR/wezterm/wezterm.lua"

# Quick edit of Zellij configuration.
alias cfgzellij="nvim $XDG_CONFIG_HOME/zellij/config.kdl"
alias cfgzellijlayoutcoding="nvim $XDG_CONFIG_HOME/zellij/layouts/coding.kdl"

# Quick edit of Zsh configuration.
alias cfgzsh="nvim $HOME/.zshrc"
alias cfgzshenv="nvim $HOME/.zshenv"
alias cfgzshaliases="nvim $HOME/.config/zsh/aliases.zsh"
alias cfgzshfunctons="nvim $HOME/.config/zsh/functions.zsh"


# -----------------------------------------------------------------------------
# GIT ACTIONS
# -----------------------------------------------------------------------------

# Using lazygit.
alias g="lazygit"

# Quick edit of Git configuration.
alias cfgg="nvim $HOME/.gitconfig"
alias cfggi="nvim $HOME/.gitignore"

# Switch to branch.
alias gs="git switch"

# Switch to branch and create it if it does not exist.
alias gsc="git switch -c"

# Reset current branch to be rebased onto origin/main.
# alias grb="git fetch origin main && git reset $(git merge-base main HEAD)"
alias grb="git fetch origin && base_branch=\$(git branch -r | grep -E 'origin/(main|master)' | head -1 | sed 's|origin/||') && git reset \$(git merge-base \$base_branch HEAD)"

# -----------------------------------------------------------------------------
# GITHUB ACTIONS
# -----------------------------------------------------------------------------

# GitHub Login
alias gha="gh auth login"

# Clone GitHub Repository.
alias ghrc="gh repo clone"

# View Repository in default browser.
alias ghrv="gh repo view --web"

# Create Pull Request.
alias ghprc="gh pr create"

# View Pull Request in default browser.
alias ghprv="gh pr view --web"


# -----------------------------------------------------------------------------
# KUBECTL ACTIONS
# -----------------------------------------------------------------------------

k="kubectl"


# -----------------------------------------------------------------------------
# NODE ACTIONS
# -----------------------------------------------------------------------------

# Use PNPM instead of NPM.
alias p="pnpm"

# Install dependencies using PNPM.
alias pi="pnpm install"


# -----------------------------------------------------------------------------
# OBSIDIAN ACTIONS
# -----------------------------------------------------------------------------
alias oosf="nvim /Users/rd/Library/Mobile\ Documents/com\~apple\~CloudDocs/Documents/notes/notes/.obsidian/snippets/"


# -----------------------------------------------------------------------------
# TERRAFORM ACTIONS
# -----------------------------------------------------------------------------

# Terraform binary.
alias tf="terraform"

# Initialize Terraform configuration.
alias tfi="terraform init"

# Initialize Terraform configuration and upgrade modules.
alias tfiu="terraform init -upgrade"

# Update Terraform providers lock file
alias tfpl="terraform providers lock -platform=darwin_amd64 -platform=darwin_arm64 -platform=linux_amd64 -platform=linux_arm64"

# Plan Terraform configuration.
alias tfp="terraform plan"

# Apply Terraform configuration without confirmation.
alias tfa="terraform apply --auto-approve"

# Destroy Terraform configuration without confirmation.
alias tfd="terraform apply -destroy --auto-approve"

# Format Terraform configuration.
alias tff="terraform fmt"
