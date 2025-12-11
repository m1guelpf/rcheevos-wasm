#!/usr/bin/env bash
set -euo pipefail

git -C rcheevos fetch --tags origin
latest_tag=$(git -C rcheevos for-each-ref --sort=-creatordate --format '%(refname:strip=2)' refs/tags | head -n1)

if [ -z "${latest_tag}" ]; then
    echo "latest_tag=" >> "$GITHUB_OUTPUT"
    echo "latest_commit=" >> "$GITHUB_OUTPUT"
    echo "current_commit=" >> "$GITHUB_OUTPUT"
    exit 0
fi

latest_commit=$(git -C rcheevos rev-list -n1 "${latest_tag}")
current_commit=$(git -C rcheevos rev-parse HEAD)

echo "latest_tag=${latest_tag}" >> "$GITHUB_OUTPUT"
echo "latest_commit=${latest_commit}" >> "$GITHUB_OUTPUT"
echo "current_commit=${current_commit}" >> "$GITHUB_OUTPUT"
