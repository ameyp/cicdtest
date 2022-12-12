#!/usr/bin/env bash

TARGET_SHA="$1"

IS_HOTFIX="0"
for branch in $(git branch -a --contains "$TARGET_SHA" --format "%(refname:short)"); do
    if [[ "$branch" =~ "release-" ]]; then
        IS_HOTFIX="1"
    fi
done

echo "$IS_HOTFIX"
