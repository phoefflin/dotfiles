# basic settings for mail and friends
$_bashrc_debug_echo "in ${BASH_SOURCE[0]}"

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    _JAVA_AWT_WM_NONREPARENTING=1
    MOZ_ENABLE_WAYLAND=1
    export MOZ_ENABLE_WAYLAND _JAVA_AWT_WM_NONREPARENTING

    export MOZ_ENABLE_WAYLAND=1
#     export XDG_CURRENT_DESKTOP=sway
    export WLR_NO_HARDWARE_CURSORS=1
    #export WLR_NO_HARDWARE_CURSORS=0
    export WLR_RENDERER_ALLOW_SOFTWARE=1
fi

