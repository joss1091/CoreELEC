# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="repository.bluerobot"
PKG_VERSION="aad484761b92427266c3f0073360d95bf48c4f45"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvstream.mx"
PKG_URL="https://github.com/joss1091/repository.bluerobot/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="Bluerobot add-on repository"
PKG_LONGDESC="Bluerobot add-on repository"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Bluerobot Repository"
PKG_ADDON_TYPE="xbmc.addon.repository"


unpack() {
  mkdir -p $PKG_BUILD/addon
  tar --strip-components=1 -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/addon

}

make_target() {
  sed -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
      -e "s|@PKG_REV@|$PKG_REV|g" \
      -i addon.xml
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/${PKG_NAME}
  cp -rP $PKG_BUILD/addon/${PKG_NAME}/* $INSTALL/usr/share/kodi/addons/${PKG_NAME}
}

