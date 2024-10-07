# Export the following envs to make Sway works properly
export _JAVA_AWT_WM_NONREPARENTING=1
export WLR_NO_HARDWARE_CURSORS=1
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME="qt6ct"       
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1


# Exports to Systemd as well
systemctl --user import-environment \
    DISPLAY \
    WAYLAND_DISPLAY \
    XDG_CURRENT_DESKTOP \
    SWAYSOCK \
    I3SOCK \
    XCURSOR_SIZE \
    XCURSOR_THEME \
    QT_QPA_PLATFORM \
    QT_QPA_PLATFORMTHEME