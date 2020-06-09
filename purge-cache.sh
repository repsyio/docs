#!/usr/bin/env bash
set -e

curl --fail -s -X POST \
    -H "Authorization: Bearer $CLOUDFLARE_TOKEN" \
    -H "Content-Type: application/json" \
    --data '{"purge_everything":true}' \
    "https://api.cloudflare.com/client/v4/zones/3f8d6aa41266eb5a328475c158a51557/purge_cache"
