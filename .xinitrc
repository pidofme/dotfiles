#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

############################################################
# keymap
setxkbmap -option ctrl:swapcaps

# fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export QT_IM_MODULE=fcitx
fcitx -r &

# emacs daemon
emacs -daemon &

# background
feh --bg-scale ${HOME}/media/photos/wallpaper/polyGuana_001_by_emciem.jpg --no-fehbg

while true
do
        MEM=$(free -m |awk '/cache:/ {print $3"M" }')
        VOL=$(amixer get Master | tail -1 | sed 's/.*\[\([0-9]*%\)\].*/\1/')
        LOCALTIME=$(date +%a\ %b\ %d\ %H:%M)
	TEM="$(($(cat /sys/class/thermal/thermal_zone0/temp) / 1000))C"

	if acpi -a | grep off-line > /dev/null
        then
                BAT=$(acpi -b | awk '{ print $4 " " $5 }' | tr -d ',')
	        xsetroot -name "Mem:$MEM Tem:$TEM Vol:$VOL Bat:$BAT $LOCALTIME"
	else
		xsetroot -name "Mem:$MEM Tem:$TEM Vol:$VOL $LOCALTIME"
	fi

        sleep 10s
done &

# Window Manager
exec dwm
