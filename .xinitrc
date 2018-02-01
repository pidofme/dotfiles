#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi


# User config
###############################################

# Keymap
setxkbmap -option ctrl:nocaps

# fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
fcitx

# For java programs
export _JAVA_AWT_WM_NONREPARENTING=1

# statusbar
while true; do

# Power/Battery Status
if [ "$( cat /sys/class/power_supply/AC/online )" -eq "1" ]; then
        DWM_BATTERY="AC";
        DWM_RENEW_INT=3;
else
        DWM_BATTERY=$(( `cat /sys/class/power_supply/BAT1/energy_now` * 100 / `cat /sys/class/power_supply/BAT1/energy_full` ));
        DWM_RENEW_INT=30;
fi;

# Memory
DWM_MEM=$( free -m |awk '/Mem:/ {print $3"M" }' );

# Thermal
DWM_TEM="$(( `cat /sys/class/thermal/thermal_zone0/temp` / 1000 ))C"

# Volume Level
DWM_VOL=$( amixer -c1 sget Master | awk -vORS=' ' '/Mono:/ {print($6$4)}' );

# Date and Time
DWM_CLOCK=$( date +%a\ %b\ %d\ %H:%M );

# Overall output command
DWM_STATUS="Power: [$DWM_BATTERY] | Mem: $DWM_MEM | TEM: $DWM_TEM| Vol: $DWM_VOL | $DWM_CLOCK";
xsetroot -name "$DWM_STATUS";
sleep $DWM_RENEW_INT;

done &

# Window Manager
exec dwm
