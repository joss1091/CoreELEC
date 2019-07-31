# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2018-present Arthur Liberman (arthur_liberman@hotmail.com)

PKG_NAME="subscription"
PKG_VERSION="8c4f6b2d2aa21ec1af8112880828b9728f28ab7f"
#PKG_SHA256="ea96288f9fb68f8c3b1b0b746892e81f9a2f1746a5bde54ea9af57c954a7fb6e"
PKG_LICENSE="GPLv3"
PKG_SITE="https://gitlab.com/tvstream-iptv/service.subscription"
PKG_URL="https://gitlab.com/tvstream-iptv/service.subscription/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="service"
PKG_SHORTDESC="verifica la subscripcion del dispositivo"
PKG_LONGDESC="Servidio para verificar si el dispositivo cuenta con una subscripcion"
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