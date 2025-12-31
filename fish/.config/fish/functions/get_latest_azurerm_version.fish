function get_latest_provider_versions
    set -q argv[1]; or set argv azurerm aws google
    for p in $argv
        set version (curl -s https://api.github.com/repos/hashicorp/terraform-provider-$p/releases/latest | jq -r .tag_name)
        echo "$p $version"
    end
end
