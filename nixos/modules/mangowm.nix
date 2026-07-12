{ config, pkgs, ... }:

{
  programs.mango.enable = true;

  # This forces NixOS to write your configuration as a raw system-wide config file
  environment.etc."xdg/mango/config.conf".text = ''
    # --- Wallpaper & Daemon Startup ---
    exec-once = awww-daemon & sleep 1 && awww img /home/a3n/Pictures/wallpaper/a_black_background_with_a_white_object_on_it.png

    # --- Keybinds ---
    bind=SUPER+SHIFT,r,reload_config
    bind=SUPER,R,spawn,rofi -show drun
    bind=SUPER,Q,spawn,kitty
    bind=SUPER,E,spawn,nautilus

    bind=SUPER,M,quit
    bind=SUPER,C,killclient

    bind=SUPER,V,togglefloating,
    bind=SUPER,P,pseudo,
    bind=SUPER,J,dwindle_toggle_split_direction

    # switch window focus
    bind=SUPER,left,focusdir,left
    bind=SUPER,right,focusdir,right
    bind=SUPER,up,focusdir,up
    bind=SUPER,down,focusdir,down

    # swap window
    bind=SUPER+SHIFT,Up,exchange_client,up
    bind=SUPER+SHIFT,Down,exchange_client,down
    bind=SUPER+SHIFT,Left,exchange_client,left
    bind=SUPER+SHIFT,Right,exchange_client,right

    bind=SUPER,1,view,1,0
    bind=SUPER,2,view,2,0
    bind=SUPER,3,view,3,0
    bind=SUPER,4,view,4,0
    bind=SUPER,5,view,5,0
    bind=SUPER,6,view,6,0
    bind=SUPER,7,view,7,0
    bind=SUPER,8,view,8,0
    bind=SUPER,9,view,9,0
    bind=SUPER,0,view,10,0

    # tag: move client to the tag and focus it
    bind=SUPER+SHIFT,1,tag,1,0
    bind=SUPER+SHIFT,2,tag,2,0
    bind=SUPER+SHIFT,3,tag,3,0
    bind=SUPER+SHIFT,4,tag,4,0
    bind=SUPER+SHIFT,5,tag,5,0
    bind=SUPER+SHIFT,6,tag,6,0
    bind=SUPER+SHIFT,7,tag,7,0
    bind=SUPER+SHIFT,8,tag,8,0
    bind=SUPER+SHIFT,9,tag,9,0
    bind=SUPER+SHIFT,0,tag,10,0

    # gaps
    bind=ALT+SHIFT,R,togglegaps
  '';
}
