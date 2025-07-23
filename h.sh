tee ~/.config/hypr/hyprland.conf > /dev/null <<'EOF'
# See https://wiki.hyprland.org/Configuring/Monitors/
monitor=,preferred,auto,auto

# See https://wiki.hyprland.org/Configuring/Keywords/ for more

# Execute your favorite apps at launch
exec-once = waybar & dunst & /usr/libexec/polkit-kde-authentication-agent-1 & hyprpaper
exec-once = wl-paste --watch cliphist store

# Set programs that you use
$terminal = kitty
$fileManager = thunar
$menu = wofi --show drun
$controlPanel = gnome-control-center

# Some default env vars.
env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt5ct

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    follow_mouse = 1
    sensitivity = 0
}

general {
    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)
    layout = dwindle
    allow_tearing = false
}

decoration {
    rounding = 10
    blur {
        enabled = true
        size = 3
        passes = 1
    }
}

animations {
    enabled = yes
    bezier = myBezier, 0.05, 0.9, 0.1, 1.05
    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    pseudotile = yes
    preserve_split = yes
}

master {
    new_on_top = true
}

gestures {
    workspace_swipe = off
}

misc {
    force_default_wallpaper = 0
}

windowrule = float,^(pavucontrol)$
windowrule = float,^(blueman-manager)$
windowrule = float,^(nm-connection-editor)$
windowrule = float,^(wdisplays)$
windowrule = float,^(gnome-control-center)$
windowrule = float,title:^(Open File)$
windowrule = float,title:^(Save File)$

# See https://wiki.hyprland.org/Configuring/Binds/ for more
$mainMod = SUPER

bind = $mainMod, Q, exec, $terminal
bind = $mainMod, C, killactive, 
bind = $mainMod, M, exit, 
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating, 
bind = $mainMod, D, exec, $menu
bind = $mainMod, S, exec, $controlPanel
bind = $mainMod, P, pseudo,
bind = $mainMod, J, togglesplit,

bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus, r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

bind = , Print, exec, grim -g "$(slurp)" - | wl-copy
bind = $mainMod, Print, exec, grim - | wl-copy

bind = $mainMod, L, exec, hyprlock
bind = $mainMod, H, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy

binde=, XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%
binde=, XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%
bind=, XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle
binde=, XF86MonBrightnessUp, exec, brightnessctl set +10%
binde=, XF86MonBrightnessDown, exec, brightnessctl set 10%-

bind=, XF86AudioPlay, exec, playerctl play-pause
bind=, XF86AudioNext, exec, playerctl next
bind=, XF86AudioPrev, exec, playerctl previous
EOF
