#! /bin/sh

pkill pipewire # pipewire should be started at this point, but just to be safe.

# Kill xdg-desktop-portal and xdg-desktop-portal-wlr
ps -ef | grep -i 'xdg.*portal' | awk '{print $2}' | xargs -I{} kill {}

# Pass the WAYLAND_DISPLAY environment variable to the dbus environment
dbus-update-activation-environment WAYLAND_DISPLAY

# Restart pipewire, xdg-desktop-portal and xdg-desktop-portal-wlr that are now aware of WAYLAND_DISPLAY
pipewire &
/usr/libexec/xdg-desktop-portal &
/usr/libexec/xdg-desktop-portal-wlr &
