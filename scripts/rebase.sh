#!/bin/bash

set -e

cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.."

if ! git diff-index --quiet HEAD; then
    echo "Not running rebase.sh because git working directory is dirty" >&2
    exit 1
fi

if [ -z "$1" ]; then
    echo "Usage: scripts/rebase.sh [crate]..." >&2
    exit 1
fi

base=$(git rev-parse HEAD)
push=()

(
    set -x
    git fetch origin --quiet --tags --force
)

for crate in "$@"; do
    (
        set -x
        git tag --delete "$crate" &>/dev/null || true
        git checkout --quiet origin/"$crate"
        git rebase --quiet "$base"
    )
    push+=("$(git rev-parse HEAD):refs/heads/$crate")
done

(
    set -x
    git checkout --quiet "$base"
)

git push origin --force-with-lease "${push[@]}"
