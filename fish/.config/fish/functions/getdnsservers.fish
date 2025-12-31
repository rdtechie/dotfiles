function getdnsservers
    echo "Current DNS Servers:"
    echo -------------------

    # Get DNS servers using scutil
    set dns_servers (scutil --dns | grep 'nameserver\[[0-9]*\]' | awk '{print $3}' | sort -u)

    # If scutil returns nothing, try networksetup as fallback
    if test (count $dns_servers) -eq 0
        # Get active network service
        set active_service (networksetup -listallnetworkservices | grep -v '*' | head -n 1)
        if test -n "$active_service"
            set dns_servers (networksetup -getdnsservers "$active_service" | grep -v "There aren't any DNS Servers" | sort -u)
        end
    end

    # Resolve and display each DNS server
    for dns_ip in $dns_servers
        # Skip if it's IPv6 or not an IP
        if not echo $dns_ip | grep -qE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$'
            if echo $dns_ip | grep -q ':'
                # IPv6 address
                set -l resolved_name (host $dns_ip 2>/dev/null | grep 'domain name pointer' | awk '{print $NF}' | sed 's/\.$//')
                if test -n "$resolved_name"
                    echo "$dns_ip → $resolved_name"
                else
                    echo "$dns_ip → (no reverse DNS)"
                end
            end
            continue
        end

        # Try to resolve IPv4 address to hostname using host command
        set -l resolved_name (host $dns_ip 2>/dev/null | grep 'domain name pointer' | awk '{print $NF}' | sed 's/\.$//')

        # If host fails, try dig
        if test -z "$resolved_name"
            set -l resolved_name (dig -x $dns_ip +short 2>/dev/null | head -n 1 | sed 's/\.$//')
        end

        # Display the results
        if test -n "$resolved_name"
            echo "$dns_ip → $resolved_name"
        else
            echo "$dns_ip → (no reverse DNS)"
        end
    end
end
