# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="vfd"
PKG_VERSION="tanix-tx3"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_DEVICE="tanix-tx3"
PKG_URL="https://raw.githubusercontent.com/arthur-liberman/vfd-configurations/master/$PKG_VERSION-vfd.conf"
PKG_DEPENDS_TARGET=""
PKG_LONGDESC="config vfd"
PKG_TOOLCHAIN="manual"


unpack() {
  mkdir -p $PKG_BUILD/config
	cp $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.conf $PKG_BUILD/config/vfd.conf
}




makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/storage_config/
  cp -rP $PKG_BUILD/config/* $INSTALL/usr/share/kodi/storage_config/
}
