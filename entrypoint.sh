#!/usr/bin/env bash

mkdir -p /root/.vnc/
echo $VNCPWD | vncpasswd -f > /root/.vnc/passwd
chmod 600 /root/.vnc/passwd
chmod 777 ~/.vnc/xstartup

echo "Starting vnc server"
vncserver :0 -rfbport $VNCPORT -geometry $VNCDISPLAY -depth $VNCDEPTH

echo "Starting novnc proxy"
/usr/share/novnc/utils/novnc_proxy --listen $NOVNCPORT --vnc localhost:$VNCPORT
