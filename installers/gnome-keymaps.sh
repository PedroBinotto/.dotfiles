#!/bin/bash

set -euo pipefail

add_gnome_keybinding() {
    if [ $# -ne 3 ]; then
        echo "Usage: add_gnome_keybinding 'Shortcut Name' 'command-to-run' 'key-combination'"
        echo "Example: add_gnome_keybinding 'Open Terminal' 'gnome-terminal' '<Ctrl><Alt>t'"
        return 1
    fi

    local name="$1"
    local command="$2"
    local binding="$3"

    local key="org.gnome.settings-daemon.plugins.media-keys custom-keybindings"
    local subkey1="${key// /.}"
    subkey1="${subkey1%s}:"
    local item_s="/${key// /\/}"
    item_s="${item_s//./\/}/"
    local firstname="custom"

    local array_str=$(gsettings get $key)
    local command_result="${array_str#@as }"
    local current_clean="${command_result#[}"
    current_clean="${current_clean%]}"

    local n=1
    local new
    while true; do
        new="${item_s}${firstname}${n}/"
        # Check if this path already exists in current shortcuts
        if [[ "$current_clean" == *"$new"* ]]; then
            ((n++))
        else
            break
        fi
    done

    # Add the new keybinding to the list
    local new_list
    if [[ "$current_clean" == "" ]]; then
        # If list was empty, start with just our new item
        new_list="['$new']"
    else
        # Add to existing list
        new_list="${command_result%]}, '$new']"
    fi

    # Create the shortcut, set the name, command and shortcut key
    local cmd0="gsettings set $key \"$new_list\""
    local cmd1="gsettings set ${subkey1}${new} name '$name'"
    local cmd2="gsettings set ${subkey1}${new} command '$command'"
    local cmd3="gsettings set ${subkey1}${new} binding '$binding'"

    # Execute all commands
    eval "$cmd0"
    eval "$cmd1"
    eval "$cmd2"
    eval "$cmd3"

    echo "Custom keybinding created successfully!"
    echo "Name: $name"
    echo "Command: $command"
    echo "Key binding: $binding"
    echo "Path: $new"
}

add_gnome_keybinding "Open Terminal (kitty)" "kitty" "<Ctrl><Alt>t"
