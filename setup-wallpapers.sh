#!/usr/bin/env bash

set -eux

WALLPAPER_DIR=~/Dropbox/open/wallpapers

: "Check if wallpaper directory exists" && {
  [ -d "$WALLPAPER_DIR" ] || exit
}

: "Check if wallpaper exists" && {
  command -v wallpaper > /dev/null || brew install wallpaper
}

: "Set wallpapers" && {
  for keycode in 18 19 20 21 23 22 26 28 25 29 32
  do
    osascript -e "tell application \"System Events\" to key code $keycode using control down"
    sleep 1
    wallpaper $WALLPAPER_DIR/$keycode.jpg
    sleep 1
  done
}
