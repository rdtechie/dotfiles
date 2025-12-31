function ghprc --description "Create a draft GitHub pull request and open it in browser"
    argparse 'b/body=' h/help -- $argv; or return

    if set -q _flag_help
        echo "Usage: ghprc [OPTIONS]"
        echo
        echo "Creates a DRAFT PR using the last commit message as title."
        echo
        echo "Options:"
        echo "  -b, --body    Custom PR body (overrides template)"
        echo "  -h, --help    Show this help"
        return 0
    end

    function __step --argument-names title
        set -l title $title
        set -e argv[1]
        printf "  •  %s...\n" "$title"
        command $argv >/dev/null 2>&1
        return $status
    end

    function __ok
        printf "  ✓  %s\n" "$argv"
    end
    function __err
        printf "  ✗  %s\n" "$argv"
    end

    # --- Context --------------------------------------------------------------
    set -l current_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)
    test -n "$current_branch"; or begin
        __err "Not in a git repository"
        return 1
    end

    set -l commit_title (git log -1 --pretty=%s 2>/dev/null)
    test -n "$commit_title"; or begin
        __err "No commit found"
        return 1
    end

    # --- Step 1: Push branch --------------------------------------------------
    __step "Pushing branch '$current_branch' to origin" git push --set-upstream origin $current_branch
    or begin
        __err "Failed to push branch"
        return 1
    end
    __ok "Branch pushed 🌿"

    echo

    # --- Step 2: Template detection ------------------------------------------
    set -l gh_args --title "$commit_title" --draft
    if set -q _flag_body
        set -a gh_args --body "$_flag_body"
    else
        set -l template_file ""
        for location in pull_request_template.md .github/pull_request_template.md docs/pull_request_template.md
            if test -f $location
                set template_file $location
                break
            end
        end
        if test -n "$template_file"
            printf "  •  Using template: %s 📄\n" "$template_file"
            set -a gh_args --body-file "$template_file"
        else
            set -a gh_args --fill
        end
    end
    set -a gh_args $argv

    echo

    # --- Step 3: Create PR ----------------------------------------------------
    __step "Creating draft pull request" gh pr create $gh_args
    or begin
        __err "Failed to create pull request"
        return 1
    end
    __ok "Draft PR created ✨"

    echo

    # --- Step 4: Open PR in browser ------------------------------------------
    __step "Opening draft PR in browser" gh pr view --web
    or begin
        __err "Failed to open PR in browser"
        return 1
    end

    echo
    __ok "All done! Your PR is ready for review 🎉"
    echo
end
