{ ... }:
{
  wayland.windowManager.hyprland = {
    settings = {
      # autostart
      exec-once = [
        # "hash dbus-update-activation-environment 2>/dev/null"
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

        "nm-applet &"
        "poweralertd &"
        "wl-clip-persist --clipboard both &"
        "wl-paste --watch cliphist store &"
        "waybar &"
        "swaync &"
        "hyprctl setcursor Simp1e 24 &"
        "swww-daemon &"

        "hyprlock"
      ];

      input = {
        kb_layout = "us,ru";
        kb_options = "grp:alt_shift_toggle";
        numlock_by_default = true;
        repeat_delay = 300;
        follow_mouse = 1;
        float_switch_override_focus = 0;
        mouse_refocus = 0;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };

      general = {
        "$mainMod" = "SUPER";
        "$term" = "kitty";
        layout = "dwindle";
        gaps_in = 2;
        gaps_out = 4;
        border_size = 2;
        "col.active_border" = "0xffbdae93";
        "col.inactive_border" = "0xff1d2021";
        # border_part_of_window = false;
        no_border_on_floating = false;
      };

      misc = {
        disable_autoreload = true;
        disable_hyprland_logo = true;
        always_follow_on_dnd = true;
        layers_hog_keyboard_focus = true;
        animate_manual_resizes = false;
        enable_swallow = true;
        focus_on_activate = true;
        new_window_takes_over_fullscreen = 2;
        middle_click_paste = false;
      };

      dwindle = {
        force_split = 2;
        special_scale_factor = 1.0;
        split_width_multiplier = 1.0;
        use_active_for_splits = true;
        pseudotile = "yes";
        preserve_split = "yes";
      };

      master = {
        new_status = "master";
        special_scale_factor = 1;
      };

      decoration = {
        rounding = 0;
        # active_opacity = 0.90;
        # inactive_opacity = 0.90;
        # fullscreen_opacity = 1.0;

        blur = {
          enabled = false;
          size = 3;
          passes = 2;
          brightness = 1;
          contrast = 1.4;
          ignore_opacity = true;
          noise = 0;
          new_optimizations = true;
          xray = true;
        };

        shadow = {
          enabled = false;

          ignore_window = true;
          offset = "0 2";
          range = 20;
          render_power = 3;
          color = "rgba(00000055)";
        };
      };

      animations = {
        enabled = false;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   0, 8, easeOutCubic,  popin 20%" # window open
          "windowsOut,  0, 8, fluent_decel,  popin 80%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      1, 6,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     1, 6,   fade_curve" # fade out (close) -> layers and windows
          "fadeSwitch,  0, 2,   easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow,  1, 20,  easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim,     1, 8,   fluent_decel" # the easing of the dimming of inactive windows
          # "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          # "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 8,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      binds = {
        movefocus_cycles_fullscreen = true;
        workspace_back_and_forth = false;
      };

      bind = [
        "$mainMod, F1, exec, show-keybinds"

        "$mainMod, Return, exec, $term"
        "$mainMod, Q, killactive,"
        "$mainMod, SPACE, fullscreen, 0"
        "$mainMod SHIFT, SPACE, fullscreen, 1"
        "$mainMod, F, exec, toggle-float"
        "$mainMod SHIFT, D, exec, rofi -show drun || pkill rofi"
        "$mainMod SHIFT, Return, exec, $term yazi"
        "$mainMod, Escape, exec, swaylock"
        "ALT, Escape, exec, hyprlock"
        "$mainMod, X, exec, power-menu"
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglesplit,"
        "$mainMod, V, exec, hyprctl dispatch exec '[float; size 925 615] pavucontrol'"
        "$mainMod SHIFT, B, exec, toggle-waybar"
        "$mainMod, C ,exec, hyprpicker -a"
        "$mainMod SHIFT, W,exec, hyprctl dispatch exec '[float; size 925 615] waypaper'"
        "$mainMod, N, exec, swaync-client -t -sw"

        # screenshot
        ",Print, exec, screenshot --copy"
        "$mainMod, Print, exec, screenshot --save"
        "$mainMod SHIFT, Print, exec, screenshot --swappy"

        # switch focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"
        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod, left,  alterzorder, top"
        "$mainMod, right, alterzorder, top"
        "$mainMod, up,    alterzorder, top"
        "$mainMod, down,  alterzorder, top"
        "$mainMod, h, alterzorder, top"
        "$mainMod, j, alterzorder, top"
        "$mainMod, k, alterzorder, top"
        "$mainMod, l, alterzorder, top"

        "CTRL ALT, up, exec, hyprctl dispatch focuswindow floating"
        "CTRL ALT, down, exec, hyprctl dispatch focuswindow tiled"

        # switch workspace
        "$mainMod, 1, focusworkspaceoncurrentmonitor, 1"
        "$mainMod, 2, focusworkspaceoncurrentmonitor, 2"
        "$mainMod, 3, focusworkspaceoncurrentmonitor, 3"
        "$mainMod, 4, focusworkspaceoncurrentmonitor, 4"
        "$mainMod, 5, focusworkspaceoncurrentmonitor, 5"
        "$mainMod, 6, focusworkspaceoncurrentmonitor, 6"
        "$mainMod, 7, focusworkspaceoncurrentmonitor, 7"
        "$mainMod, 8, focusworkspaceoncurrentmonitor, 8"
        "$mainMod, 9, focusworkspaceoncurrentmonitor, 9"
        "$mainMod, 0, focusworkspaceoncurrentmonitor, 10"

        # same as above, but switch to the workspace
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        # window control
        "$mainMod SHIFT, left, movewindow, l"
        "$mainMod SHIFT, right, movewindow, r"
        "$mainMod SHIFT, up, movewindow, u"
        "$mainMod SHIFT, down, movewindow, d"
        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod CTRL, left, resizeactive, -80 0"
        "$mainMod CTRL, right, resizeactive, 80 0"
        "$mainMod CTRL, up, resizeactive, 0 -80"
        "$mainMod CTRL, down, resizeactive, 0 80"
        "$mainMod CTRL, h, resizeactive, -80 0"
        "$mainMod CTRL, j, resizeactive, 0 80"
        "$mainMod CTRL, k, resizeactive, 0 -80"
        "$mainMod CTRL, l, resizeactive, 80 0"

        "$mainMod ALT, left, moveactive,  -80 0"
        "$mainMod ALT, right, moveactive, 80 0"
        "$mainMod ALT, up, moveactive, 0 -80"
        "$mainMod ALT, down, moveactive, 0 80"
        "$mainMod ALT, h, moveactive,  -80 0"
        "$mainMod ALT, j, moveactive, 0 80"
        "$mainMod ALT, k, moveactive, 0 -80"
        "$mainMod ALT, l, moveactive, 80 0"

        # media and volume controls
        # ",XF86AudioMute,exec, pamixer -t"
        ",XF86AudioPlay,exec, playerctl play-pause"
        ",XF86AudioNext,exec, playerctl next"
        ",XF86AudioPrev,exec, playerctl previous"
        ",XF86AudioStop,exec, playerctl stop"

        "$mainMod, mouse_down, workspace, e-1"
        "$mainMod, mouse_up, workspace, e+1"

        # clipboard manager
        "$mainMod SHIFT, C, exec, cliphist list | rofi -dmenu -theme-str 'window {width: 50%;} listview {columns: 1;}' | cliphist decode | wl-copy"
      ];

      # # binds active in lockscreen
      # bindl = [
      #   # laptop brigthness
      #   ",XF86MonBrightnessUp, exec, brightnessctl set 5%+"
      #   ",XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      #   "$mainMod, XF86MonBrightnessUp, exec, brightnessctl set 100%+"
      #   "$mainMod, XF86MonBrightnessDown, exec, brightnessctl set 100%-"
      # ];

      # # binds that repeat when held
      # binde = [
      #   ",XF86AudioRaiseVolume,exec, pamixer -i 2"
      #   ",XF86AudioLowerVolume,exec, pamixer -d 2"
      # ];

      # mouse binding
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # windowrule
      windowrule = [
        "float,class:^(Viewnior)$"
        "float,class:^(imv)$"
        "float,class:^(mpv)$"
        "tile,class:^(Aseprite)$"
        "float,class:^(Audacious)$"
        "pin,class:^(rofi)$"
        "pin,class:^(waypaper)$"
        # "idleinhibit focus,mpv"
        # "float,udiskie"
        "float,title:^(Transmission)$"
        "float,title:^(Volume Control)$"
        "float,title:^(Firefox — Sharing Indicator)$"
        "move 0 0,title:^(Firefox — Sharing Indicator)$"
        "size 700 450,title:^(Volume Control)$"
        "move 40 55%,title:^(Volume Control)$"

        "float, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"
        "opacity 1.0 override 1.0 override, title:^(.*imv.*)$"
        "opacity 1.0 override 1.0 override, title:^(.*mpv.*)$"
        "opacity 1.0 override 1.0 override, class:(Aseprite)"
        "opacity 1.0 override 1.0 override, class:(Unity)"
        "opacity 1.0 override 1.0 override, class:(zen)"
        "opacity 1.0 override 1.0 override, class:(evince)"
        "workspace 1, class:^(zen)$"
        "workspace 3, class:^(evince)$"
        "workspace 4, class:^(Gimp-2.10)$"
        "workspace 4, class:^(Aseprite)$"
        "workspace 5, class:^(Audacious)$"
        "workspace 5, class:^(Spotify)$"
        "workspace 8, class:^(com.obsproject.Studio)$"
        "workspace 10, class:^(discord)$"
        "workspace 10, class:^(WebCord)$"
        "idleinhibit focus, class:^(mpv)$"
        "idleinhibit fullscreen, class:^(firefox)$"
        "float,class:^(org.gnome.Calculator)$"
        "float,class:^(waypaper)$"
        "float,class:^(zenity)$"
        "size 850 500,class:^(zenity)$"
        "size 725 330,class:^(SoundWireServer)$"
        "float,class:^(org.gnome.FileRoller)$"
        "float,class:^(org.pulseaudio.pavucontrol)$"
        "float,class:^(SoundWireServer)$"
        "float,class:^(.sameboy-wrapped)$"
        "float,class:^(file_progress)$"
        "float,class:^(confirm)$"
        "float,class:^(dialog)$"
        "float,class:^(download)$"
        "float,class:^(notification)$"
        "float,class:^(error)$"
        "float,class:^(confirmreset)$"
        "float,title:^(Open File)$"
        "float,title:^(File Upload)$"
        "float,title:^(branchdialog)$"
        "float,title:^(Confirm to replace files)$"
        "float,title:^(File Operation Progress)$"

        "opacity 0.0 override,class:^(xwaylandvideobridge)$"
        "noanim,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
        "maxsize 1 1,class:^(xwaylandvideobridge)$"
        "noblur,class:^(xwaylandvideobridge)$"

        # No gaps when only
        "bordersize 0, floating:0, onworkspace:w[t1]"
        "rounding 0, floating:0, onworkspace:w[t1]"
        "bordersize 0, floating:0, onworkspace:w[tg1]"
        "rounding 0, floating:0, onworkspace:w[tg1]"
        "bordersize 0, floating:0, onworkspace:f[1]"
        "rounding 0, floating:0, onworkspace:f[1]"

        # "maxsize 1111 700, floating: 1"
        # "center, floating: 1"

        # Remove context menu transparency in chromium based apps
        "opaque,class:^()$,title:^()$"
        "noshadow,class:^()$,title:^()$"
        "noblur,class:^()$,title:^()$"
      ];

      # No gaps when only
      workspace = [
        "w[t1], gapsout:0, gapsin:0"
        "w[tg1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];
    };

    extraConfig = "
      monitor=,preferred,auto,1

      xwayland {
        force_zero_scaling = true
      }
    ";
  };
}
