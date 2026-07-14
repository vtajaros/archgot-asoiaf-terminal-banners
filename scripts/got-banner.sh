#!/bin/bash
# got-banner.sh
# Prints a random Game of Thrones banner on interactive shell startup.

# Exit if not running in an interactive shell to prevent breaking
# scripts, cron jobs, or non-interactive remote commands (e.g., scp/rsync).
case $- in
  *i*) ;;
  *) return ;;
esac

# Check for local install first, then global install
if [[ -d "$HOME/.local/share/got-banners" ]]; then
  BANNER_DIR="$HOME/.local/share/got-banners"
elif [[ -d "/usr/share/archgot/banners" ]]; then
  BANNER_DIR="/usr/share/archgot/banners"
else
  return 2>/dev/null || exit 0
fi

# Ensure the directory exists and contains files before proceeding
if [[ -d "$BANNER_DIR" ]]; then
  # Load all .txt banners into an array
  mapfile -t banners < <(find "$BANNER_DIR" -maxdepth 1 -name "*.txt" -print)
  
  if [ "${#banners[@]}" -gt 0 ]; then
    # Pick a random banner and display it
    cat "${banners[RANDOM % ${#banners[@]}]}"
    echo "" # Add a trailing newline for spacing before the prompt
  fi
fi
