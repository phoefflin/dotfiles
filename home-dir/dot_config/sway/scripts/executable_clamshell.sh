#!/usr/bin/bash

OUTPUT="${1:-eDP-1}"

if cat /proc/acpi/button/lid/LID0/state | grep -q open; then
    swaymsg output "<${OUTPUT}>" enable
else
    swaymsg output "<${OUTPUT}>" disable
fi
