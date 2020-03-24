#=-=-=-=-=-=-=-  Basic Definitions

for_window [class="^.*"] border pixel 0
gaps inner 5
gaps outer 1
set $mod Mod4



#=-=-=-=-=-=-=-  Fonts

# Window titles
font pango:URW Gothic Book 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:URW Gothic Book 8



#=-=-=-=-=-=-=- System

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.
exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
exec --no-startup-id nm-applet



#=-=-=-=-=-=-=- Volume Control [PulseAudio]


# set $refresh_i3status killall -SIGUSR1 i3status
# bindsym XF86AudioRaiseVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ +10% && $refresh_i3status
# bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10% && $refresh_i3status
# bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle && $refresh_i3status
# bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle && $refresh_i3status



#=-=-=-=-=-=-=-  Workspace

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

set $ws1 "1 "
set $ws2 "2 "
set $ws3 "3 "
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9 "
set $ws10 "10 "

# switch to workspace
bindsym $mod+1 workspace $ws1
bindsym $mod+2 workspace $ws2
bindsym $mod+3 workspace $ws3
bindsym $mod+4 workspace $ws4
bindsym $mod+5 workspace $ws5
bindsym $mod+6 workspace $ws6
bindsym $mod+7 workspace $ws7
bindsym $mod+8 workspace $ws8
bindsym $mod+9 workspace $ws9
bindsym $mod+0 workspace $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $ws1
bindsym $mod+Shift+2 move container to workspace $ws2
bindsym $mod+Shift+3 move container to workspace $ws3
bindsym $mod+Shift+4 move container to workspace $ws4
bindsym $mod+Shift+5 move container to workspace $ws5
bindsym $mod+Shift+6 move container to workspace $ws6
bindsym $mod+Shift+7 move container to workspace $ws7
bindsym $mod+Shift+8 move container to workspace $ws8
bindsym $mod+Shift+9 move container to workspace $ws9
bindsym $mod+Shift+0 move container to workspace $ws10



#=-=-=-=-=-=-=-  Keybindings

#Applications shortcut
bindsym $mod+Return exec gnome-terminal
bindsym $mod+x exec i3lock -i Pictures/Wallpaper/rsz_chinred_city.png
bindsym $mod+e exec pcmanfm
bindsym $mod+Shift+n exec mousepad .config/i3/config
bindsym $mod+n exec mousepad
bindsym $mod+q exec firefox

# kill focused window
bindsym Ctrl+q kill

# start dmenu
bindsym $mod+d exec dmenu_run -l 10 -nf "#ff3b3b" -nb "#3b0000" -sf black -sb orange -x 300 -y 250 -w 766
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop

# hide/unhide i3status bar
bindsym $mod+m bar mode toggle

# reload the configuration file
bindsym $mod+Shift+c reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'Do you really want to exit i3 mate?' -B 'mhm' 'i3-msg exit'"



#=-=-=-=-=-=-=-  Window management

# change focus
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+h split h

# split in vertical orientation
bindsym $mod+v split v

#resize windows
bindsym $mod+r mode "resize"

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+t layout tabbed
bindsym $mod+w layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
# bindsym $mod+y focus child

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}




#-=-=-=-=-=-=- Application workspace assignment

assign [class="firefox"] $ws3
assign [class="Brave-browser"] $ws3
assign [class="mousepad"] $ws2
assign [class="minecraft-launcher"] $ws10
assign [class="vlc"] $ws9



#-=-=-=-=-=-=- Color Scheme

set $bg-color 	         #620000
set $inactive-bg-color   #620000
set $text-color          #b1ffff
set $inactive-text-color #ff8b8b
set $urgent-bg-color     #ffb2b2

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          #ff7676
client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color #ff7676
client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color #ff7676
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          #ff7676


# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
	font pango:mono 10
	position top
	mode dock
	modifier None
	colors {
		background $bg-color
	    	separator #757575
		#                  border             background         text
		focused_workspace  $bg-color          $bg-color          $text-color
		inactive_workspace $inactive-bg-color $inactive-bg-color $inactive-text-color
		urgent_workspace   $urgent-bg-color   $urgent-bg-color   $text-color
	}
}




#-=-=-=-=-=-=-  Sreen brightness controls

bindsym XF86MonBrightnessUp exec xbacklight -inc 10 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 5 # decrease screen brightness



#-=-=-=-=-=-=- Autostart scripts/programs

# Hide mouse when typing
exec --no-startup-id exec xbanish -i shift -i control -i mod1 -i mod4

exec volumeicon
exec_always feh --bg-scale /home/zola/Pictures/Wallpaper/wizard-vs-dragon.jpg
exec_always watch -n 3600 /home/zola/.config/i3/scripts/battery.sh
exec flameshot



#-=-=-=-=-=-=- screenshots and recording

bindsym Print 			exec i3-scrot # --no-startup-id maim pic-full-"$(date '+%y%m%d-%H%M-%S').png"
bindsym Shift+Print 		exec --no-startup-id maimpick
bindsym $mod+Print		exec --no-startup-id dmenurecord
bindsym $mod+Scroll_Lock	exec --no-startup-id "killall screenkey || screenkey"
bindsym $mod+Delete		exec $stoprec
bindsym XF86Launch1		exec --no-startup-id xset dpms force off



#-=-=-=-=-=-=- Floating windows

for_window [class="Lxappearance" instance="lxappearance"] floating enable
