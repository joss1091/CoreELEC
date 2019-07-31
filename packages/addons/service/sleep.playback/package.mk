# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Arthur Liberman (arthur_liberman@hotmail.com)

PKG_NAME="sleep.playback"
PKG_VERSION="c67e92d5d546d2b44f990982c6fcac6b2fa30e95"
#PKG_SHA256="ea96288f9fb68f8c3b1b0b746892e81f9a2f1746a5bde54ea9af57c954a7fb6e"
PKG_LICENSE="GPLv3"
PKG_SITE="https://gitlab.com/tvstream-iptv/service.sleep.playback"
PKG_URL="https://gitlab.com/tvstream-iptv/service.sleep.playback/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="Serviicio para detener reproduccion por inactividad"
PKG_LONGDESC="Servicio para monitorear cuando se encuentra reproduciendo el dispositivo y existe incatividad lo detiene mostrando un mensaje"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.service"



unpack() {
  mkdir -p $PKG_BUILD/addon
  tar --strip-components=1 -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/addon

}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
  cp -rP $PKG_BUILD/addon/* $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
}

post_makeinstall_target() {
  :
}
