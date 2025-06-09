#!/bin/bash

# === CONFIGURATION ===
TARGET_ROOT="devops_learning"

# === CHECK: Are we in a git repo? ===
if [ ! -d ".git" ]; then
  echo "❌ This folder is not a git repository. Please run this script inside your cloned repo."
  exit 1
fi

# === DOWNLOAD FILES ===
echo "📥 Downloading BanditLevels.zip..."
curl -L -o BanditLevels.zip "https://chat.openai.com/sandbox/download/BanditLevels.zip"

echo "📂 Unzipping..."
unzip -o BanditLevels.zip
rm BanditLevels.zip

# === CREATE ROOT FOLDER ===
mkdir -p "$TARGET_ROOT"

# === ORGANIZE FILES BY LEVEL ===
for file in BanditLevels/Level*.md; do
  # Extract level number (e.g., Level00-01.md -> 00)
  level_num=$(echo "$file" | grep -oP 'Level\K[0-9]{2}')
  level_folder="$TARGET_ROOT/Level$level_num"

  mkdir -p "$level_folder"
  mv "$file" "$level_folder/"
done

# === CLEANUP ===
rm -rf BanditLevels

# === GIT COMMIT & PUSH ===
echo "📝 Staging changes..."
git add "$TARGET_ROOT"
git commit -m "Organize Bandit walkthroughs in per-level folders under devops_learning"
git push

echo "✅ Done! Each level is now organized into its own folder under '$TARGET_ROOT'."
