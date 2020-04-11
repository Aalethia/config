#=-=-=-=-=-=-=-  Basic Definitions

for_window [class="^.*"] border pixel 0
gaps inner 7
gaps outer 3
set $mod Mod4

# switch to workspace with urgent window automatically
for_window [urgent=latest] focus



#=-=-=-=-=-=-=-  Fonts

font xft:FontAwesome 11



#=-=-=-=-=-=-=- System

exec --no-startup-id xss-lock --transfer-sleep-lock -- i3lock --nofork

exec --no-startup-id nm-applet



#=-=-=-=-=-=-=-  Workspace

floating_modifier $mod

set $ws1 "1 "
set $ws2 "2 "
set $ws3 "3 "
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9 "
set $ws10 "10 "

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

# navigate workspaces next/previous
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev



#=-=-=-=-=-=-=-  Keybindings

#Applications shortcut
bindsym $mod+Return exec gnome-terminal
bindsym $mod+x exec blurlock
bindsym $mod+e exec pcmanfm
bindsym $mod+Shift+n exec mousepad .i3/config
bindsym $mod+n exec mousepad
bindsym $mod+q exec firefox

# kill focused window
bindsym Ctrl+q kill

# start dmenu
bindsym $mod+d exec dmenu_run -l 10 -nf "#ff3b3b" -nb "#360224" -sf "#890440" -sb "#ff0000" -x 300 -y 250 -w 766
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

set $bg-color 	         #890440
set $inactive-bg-color   #890440
set $text-color          #e3dc03
set $inactive-text-color #12ffa8
set $urgent-bg-color     #ff0000

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

bindsym XF86MonBrightnessUp exec "xbacklight -inc 10; notify-send 'brightness +10'"
bindsym XF86MonBrightnessDown exec "xbacklight -dec 5; notify-send 'brightness -5'"




#-=-=-=-=-=-=-  # mic settings

# mute
bindsym $mod+Ctrl+k exec "amixer set Capture nocap; notify-send 'mic mute'"

# unmute
bindsym $mod+Ctrl+l exec "amixer set Capture cap; notify-send 'mic unmute'"

# increase volume
bindsym $mod+l exec "amixer set Capture 5%+ ; notify-send 'mic +5'"

# decrease
bindsym $mod+k exec "amixer set Capture 5%- ; notify-send 'mic -5'"



#-=-=-=-=-=-=- Autostart scripts/programs

# Hide mouse when typing
exec --no-startup-id exec xbanish -i shift -i control -i mod1 -i mod4

exec volumeicon
exec_always feh --bg-scale /run/media/newHome/Downloads/s7lyyv3g67fz.jpg
exec flameshot
exec --no-startup-id xfce4-power-manager
exec --no-startup-id pamac-tray
exec --no-startup-id clipit
exec --no-startup-id xautolock -time 10 -locker blurlock
exec rm -R GPUCache  #cause why not?
exec amixer set Capture nocap


#-=-=-=-=-=-=- screenshots and recording

bindsym Print 			exec i3-scrot # --no-startup-id maim pic-full-"$(date '+%y%m%d-%H%M-%S').png"
bindsym Shift+Print 		exec --no-startup-id maimpick
bindsym $mod+Print		exec --no-startup-id dmenurecord
bindsym $mod+Scroll_Lock	exec --no-startup-id "killall screenkey || screenkey"
bindsym $mod+Delete		exec $stoprec
bindsym XF86Launch1		exec --no-startup-id xset dpms force off



#-=-=-=-=-=-=- Floating windows

for_window [class="Lxappearance"] floating enable sticky enable border normal
