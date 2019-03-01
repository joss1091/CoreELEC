# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2016-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="repository.bluerobot"
PKG_VERSION="1.0"
PKG_REV="1"
PKG_ARCH="none"
PKG_LICENSE="GPL"
PKG_SITE="http://www.tvstream.mx"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION=""
PKG_SHORTDESC="Bluerobot add-on repository"
PKG_LONGDESC="Bluerobot add-on repository"
PKG_TOOLCHAIN="manual"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Bluerobot Repository"
PKG_ADDON_TYPE="xbmc.addon.repository"

make_target() {
  sed -e "s|@PKG_VERSION@|$PKG_VERSION|g" \
      -e "s|@PKG_REV@|$PKG_REV|g" \
      -i addon.xml
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID
  cp -R $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID
}
