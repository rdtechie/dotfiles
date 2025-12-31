function get_terraform_provider_versions
    # Defaults; can be overridden by args
    set -l providers $argv
    if test (count $providers) -eq 0
        set providers ansible azurerm azuread kubernetes helm null random time tls
    end

    # Optional auth header for curl
    set -l auth
    if set -q GITHUB_TOKEN
        # Two separate args for curl (-H and the header value) in fish list form
        set auth -H "Authorization: Bearer $GITHUB_TOKEN"
    end

    for p in $providers
        switch $p
            case ansible
                set -l owner ansible
                set -l repo terraform-provider-ansible
            case '*'
                set -l owner hashicorp
                set -l repo terraform-provider-$p
        end

        set -l api_base https://api.github.com/repos/$owner/$repo

        # ---- 1) Prefer gh api if available (best for rate limits)
        if type -q gh
            set -l tag (gh api "$api_base/releases/latest" --jq .tag_name 2>/dev/null)
            set -l html_url (gh api "$api_base/releases/latest" --jq .html_url 2>/dev/null)

            if test -n "$tag"
                set -l ver (string replace -r '^v' '' -- $tag)
                echo "$p $ver → $html_url"
                continue
            end

            # Fallback to tags if no formal release
            set -l tag (gh api "$api_base/tags?per_page=1" --jq '.[0].name' 2>/dev/null)
            if test -n "$tag"
                set -l ver (string replace -r '^v' '' -- $tag)
                echo "$p $ver → https://github.com/$owner/$repo/releases/tag/$tag"
                continue
            end
        end

        # ---- 2) Curl path with proper headers and HTTP code handling
        set -l headers -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" -H "User-Agent: get_terraform_provider_versions"
        set -l raw (curl -sS -w "\n%{http_code}" $headers $auth "$api_base/releases/latest")
        set -l lines (string split '\n' -- $raw)
        set -l http $lines[-1]
        set -e lines[-1]
        set -l body (string join \n -- $lines)

        if test "$http" = 200
            set -l tag (echo $body | jq -r '.tag_name // empty')
            set -l html_url (echo $body | jq -r '.html_url // empty')
            if test -n "$tag"
                set -l ver (string replace -r '^v' '' -- $tag)
                echo "$p $ver → $html_url"
                continue
            end
        end

        # ---- 3) Fallback to tags (works even without release objects)
        set -l raw_tags (curl -sS -w "\n%{http_code}" $headers $auth "$api_base/tags?per_page=1")
        set -l lines_tags (string split '\n' -- $raw_tags)
        set -l http_tags $lines_tags[-1]
        set -e lines_tags[-1]
        set -l body_tags (string join \n -- $lines_tags)

        if test "$http_tags" = 200
            set -l tag (echo $body_tags | jq -r '.[0].name // empty')
            if test -n "$tag"
                set -l ver (string replace -r '^v' '' -- $tag)
                echo "$p $ver → https://github.com/$owner/$repo/releases/tag/$tag"
                continue
            end
        end

        # ---- 4) If everything failed, show a helpful message
        echo "$p (no version found; likely rate-limited or repo unreachable)" >&2
    end
end
