FROM kalilinux/kali-last-release:latest

ARG KALI_METAPACKAGE=default
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    kali-desktop-xfce dbus dbus-x11 novnc net-tools tightvncserver xfonts-base \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ENV USER=root
ENV VNCEXPOSE=1
ENV VNCPORT=5900
ENV VNCDISPLAY=1200x900
ENV VNCDEPTH=16
ENV VNCPWD=h4x0r
ENV NOVNCPORT=8080
ENV TZ=Europe/London

COPY ./vnc /root/.vnc

COPY ./entrypoint.sh /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["bash", "/entrypoint.sh"]
