#!/usr/bin/env bash

TARGET_REF="$1"

GITHUB_ACTION=${GITHUB_ACTION:-}

# find existing tags
TAGS_AT_REF=$(git tag --points-at $TARGET_REF 'tag-*')
if [ "$TAGS_AT_REF" != "" ]; then
    echo "The following tags were already found. Not applying new tag."
    echo "$TAGS_AT_REF"
    exit 0
fi

TAG_NAME="tag-$(date +%s)"
echo "Tag: '$TAG_NAME'"

if [ -n "$GITHUB_ACTION" ]; then
    echo "tag_name=$TAG_NAME" >> $GITHUB_OUTPUT
fi
