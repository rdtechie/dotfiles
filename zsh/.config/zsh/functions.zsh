function sesh-sessions() {
  {
    exec </dev/tty
    exec <&1
    local session
    session=$(sesh list -t -c | fzf --height 40% --reverse --border-label ' sesh ' --border --prompt '⚡  ')
    zle reset-prompt > /dev/null 2>&1 || true
    [[ -z "$session" ]] && return
    sesh connect $session
  }
}

function greset() {
    echo "Retrieving default branchname from GitHub for this Repository..."
    CURRENT_BRANCH_NAME=$(git branch --show-current)
    DEFAULT_BRANCH_NAME=$(gh repo view --json defaultBranchRef --jq .defaultBranchRef.name)
    echo "Resetting branch '$CURRENT_BRANCH_NAME' to be rebased onto '$DEFAULT_BRANCH_NAME'"
    git reset (git merge-base $DEFAULT_BRANCH_NAME HEAD)
    echo "Current branch reset! Add and commit your changes again!"
}
