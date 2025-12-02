#!/usr/bin/env bash

export PASSWORD_STORE_DIR="$HOME/.note-store"

# create store directory if missing
mkdir -p "$PASSWORD_STORE_DIR"

# sample sections to mix into notes for grep testing
topics=("Golang" "Bash" "Markdown" "FZF" "GPG" "Pass" "Linux" "Notes" "Scripting" "DevOps")
adjectives=("quick" "lazy" "clever" "fancy" "robust" "tiny" "huge" "weird" "cool" "funny")

for i in $(seq 1 20); do
  topic=${topics[$((RANDOM % ${#topics[@]}))]}
  adj=${adjectives[$((RANDOM % ${#adjectives[@]}))]}
  name="note-$i.md"

  content="# Note $i: $topic

This is a **$adj** test note about $topic.

## Example Code

\`\`\`bash
echo \"Hello from note $i about $topic!\"
\`\`\`

## Description

Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Pellentesque habitant morbi tristique senectus et netus.

- Random adjective: $adj
- Topic: $topic
"

  printf "%s" "$content" | pass insert -m "$name" >/dev/null
done

echo "Done. Created 20 markdown notes."
