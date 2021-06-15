cat ../ex00/hh.json | jq -r '.items | map([.id,.created_at,.name,.has_test,.alternate_url] | join(",")) | join("\n")'
