#!/bin/zsh

if [[ -d /etc/X11/xinit/xinitrc.d ]]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [[ -x $f ]] && . $f
  done
  unset f
fi

mkdir -p $XDG_RUNTIME_DIR/{adobe,macromedia}
ln -sfn $XDG_RUNTIME_DIR/adobe ~/.adobe
ln -sfn $XDG_RUNTIME_DIR/macromedia ~/.macromedia

synclient HorizTwoFingerScroll=1
xset -b
setxkbmap -option ctrl:nocaps
setxkbmap -option shift:both_shiftlock
xmodmap -e "keycode 135 = Super_R"
hsetroot -full ~/images/background.png
exec i3
