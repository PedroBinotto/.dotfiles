#!/bin/bash

set -euo pipefail

# Function definitions

add_shortcut() {
  local NAME="$1"
  local COMMAND="$2"
  local BINDING="$3"
  local INDEX="${4:-0}"

  local BASE_PATH="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${INDEX}/"
  local SCHEMA="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:$BASE_PATH"

  echo "Adding shortcut: $NAME ($BINDING → $COMMAND) at index $INDEX"

  local EXISTING
  EXISTING=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)

  if [[ "$EXISTING" == "@as []" || "$EXISTING" == "[]" ]]; then
    UPDATED="['$BASE_PATH']"
  elif [[ "$EXISTING" != *"$BASE_PATH"* ]]; then
    UPDATED=$(echo "$EXISTING" | sed "s/]$/, '${BASE_PATH//\//\\/}']/")
  else
    UPDATED="$EXISTING"
  fi

  gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$UPDATED"

  gsettings set "$SCHEMA" name "$NAME"
  gsettings set "$SCHEMA" command "$COMMAND"
  gsettings set "$SCHEMA" binding "$BINDING"
}

add_shortcut "Kitty Terminal" "kitty" "<Ctrl><Alt>t" 1
