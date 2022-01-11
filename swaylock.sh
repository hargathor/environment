#!/bin/bash
# packages needed :
# - grim
# - imagemagick
# - swaylock
# thanks to : https://thomas-leister.de/en/sway-window-manager/#lockscreen

readonly ICON="${HOME}/Images/icon-lock.png"
readonly TMPBG=$(mktemp /tmp/bg.XXXXXXXXX.png)
readonly TMPTXT=$(mktemp /tmp/txt.XXXXXXXXX.png)
readonly SCREENWIDTH=1366

grim "${TMPBG}"
convert "${TMPBG}" -scale 25% -blur 0x2 -scale 400% -fill black -colorize 50% "${TMPBG}"
convert "${TMPBG}" "${ICON}" -gravity center -composite -matte "${TMPBG}"
# convert -size ${SCREENWIDTH}x60 xc:black -font Liberation-Sans -pointsize 26 -fill white -gravity center -annotate +0+0 'Type password to unlock' ${TMPTXT};
convert ${TMPBG} ${TMPTXT} -gravity center -geometry +0+200 -composite ${TMPBG}
swaylock -s fill -i "${TMPBG}"

rm -f "${TMPBG}"
rm -f "${TMPTXT}"
