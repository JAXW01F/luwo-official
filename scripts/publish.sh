#!/usr/bin/env bash
set -euo pipefail

# Usage: scripts/publish.sh [branch] [remote]
# Pushes the current branch to GitHub so it shows up in your repo and Pages.

BRANCH_ARG=${1:-}
REMOTE=${2:-origin}

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Not inside a git repository" >&2
  exit 1
fi

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [[ "$CURRENT_BRANCH" == "HEAD" ]]; then
  echo "Detached HEAD detected. Checkout a branch or specify one explicitly: scripts/publish.sh <branch> [remote]" >&2
  exit 1
fi

BRANCH=${BRANCH_ARG:-$CURRENT_BRANCH}

if [[ -z "$BRANCH" ]]; then
  echo "Branch name cannot be empty" >&2
  exit 1
fi

git remote get-url "$REMOTE" >/dev/null 2>&1 || {
  echo "Remote '$REMOTE' is not configured. Run: git remote add $REMOTE <url>" >&2
  exit 1
}

if ! git show-ref --verify --quiet "refs/heads/$BRANCH"; then
  echo "Local branch '$BRANCH' does not exist. Create or checkout it first." >&2
  exit 1
fi

if [[ -n "$(git status --porcelain)" ]]; then
  echo "Working tree has uncommitted changes. Please commit before publishing." >&2
  exit 1
fi

git push -u "$REMOTE" "$BRANCH"

echo "Pushed $BRANCH to $REMOTE. If using GitHub Pages, enable Pages for this branch in Settings → Pages."
