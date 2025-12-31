if status is-interactive

    # Styling
    fish_config theme choose rose-pine
    set -g fish_greeting ""

    # Directories & Files
    abbr --add .. "cd .."
    abbr --add ... "cd ../.."
    abbr --add .... "cd ../../.."
    abbr --add ~ "cd ~"
    abbr --add ll "ls -lah"
    abbr --add la "ls -a"
    abbr --add l "ls -lh"
    abbr --add md "mkdir -p"
    abbr --add rd "rm -rf"

    # Git
    abbr --add g lazygit
    abbr --add ga git add
    abbr --add gb git blame
    abbr --add gc git commit
    abbr --add gco git checkout
    abbr --add gd git diff
    abbr --add gl git log
    abbr --add gm git merge
    abbr --add gp git pull
    abbr --add gp git push
    abbr --add gr git rebase
    abbr --add grs git reset
    abbr --add gstp git stash pop
    abbr --add gst git status
    abbr --add gsh git show

    # Miscellaneous
    abbr --add c clear
    abbr --add h history
    abbr --add zadd "ls -d */ | xargs -I {} zoxide add {}"

    # Tmux
    abbr --add t tmux
    abbr --add ta tmux attach
    abbr --add tl tmux list-sessions
    abbr --add ts tmux-sessionizer
    abbr --add tks tmux kill-server

    # Vim
    abbr --add v nvim
    abbr --add vi nvim
    abbr --add vim nvim

    # Shell Completions
    if command -v mise >/dev/null
        mise activate fish | source
        mise hook-env -s fish | source
        mise complete -s fish | source
    end

    if command -v op >/dev/null # 1Password CLI
        op completion fish | source
    end

    if command -v starship >/dev/null
        starship init fish | source
    end

    if command -v uv >/dev/null
        uv generate-shell-completion fish | source
        uvx --generate-shell-completion fish | source
    end

    if command -v zoxide >/dev/null
        zoxide init fish | source
    end

end
