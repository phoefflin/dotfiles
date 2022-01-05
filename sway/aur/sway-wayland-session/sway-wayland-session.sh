#!/bin/bash

# exec 2>/tmp/sway.$USER.$XDG_SESSION_ID.out
# exec 1>&2

# echo "set 1" 
# set > /tmp/set.$USER.$XDG_SESSION_ID.1

XDG_SESSION_DESKTOP=sway
DESKTOP_SESSION=sway
# XDG_CURRENT_DESKTOP=gnome

export XDG_SESSION_DESKTOP DESKTOP_SESSION

# app specific vars for wayland
CHROMIUM_USER_FLAGS="--enable-features=UseOzonePlatform --ozone-platform=wayland"
_JAVA_AWT_WM_NONREPARENTING=1
MOZ_ENABLE_WAYLAND=1
WLR_NO_HARDWARE_CURSORS=1
WLR_RENDERER_ALLOW_SOFTWARE=1

export CHROMIUM_USER_FLAGS _JAVA_AWT_WM_NONREPARENTING MOZ_ENABLE_WAYLAND WLR_RENDERER_ALLOW_SOFTWARE

# set vars from ~/.config/environment.d
# this SHOULD not be necessary because GDM should already do that. Somehow it 
# doesn't work for PATH though. So to also set PATH correctly based on environment.d
# we just reevaluate here.
export $(/usr/lib/systemd/user-environment-generators/30-systemd-environment-d-generator)

# echo "set 2" 
# set > /tmp/set.$USER.$XDG_SESSION_ID.2

exec sway "$@"
