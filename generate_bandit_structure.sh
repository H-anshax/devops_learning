#!/bin/bash

TARGET_ROOT="devops_learning"
mkdir -p "$TARGET_ROOT"

for i in $(seq -w 00 20); do
  LEVEL_FOLDER="$TARGET_ROOT/Level$i"
  mkdir -p "$LEVEL_FOLDER"

  cat <<EOF > "$LEVEL_FOLDER/README.md"
# Bandit Level $i → Level $(printf "%02d" $((10#$i + 1)))

## 🧠 Objective
> Brief description of what this level tests or introduces.

## 📁 Details
- Host: bandit.labs.overthewire.org
- Port: 2220
- Username: bandit$i

## 💻 Commands Used
\`\`\`bash
# Sample commands for solving this level
# Replace these with actual steps (no passwords)
ssh bandit$i@bandit.labs.overthewire.org -p 2220
# ... more commands here ...
\`\`\`

## ✅ Notes
- No passwords are shown.
- Only logic and commands used to solve the level are included.
EOF

done

