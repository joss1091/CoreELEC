# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="watchlist"
PKG_VERSION="0.0.2"
#PKG_SHA256="33edd6ba4d7b52b9f3eb810311fc468689aac8c412358dc8e66c85876aecab5b"
PKG_LICENSE="GPL"
PKG_SECTION="script"
PKG_SITE="https://coreelec.org"
PKG_URL="https://mirrors.kodi.tv/addons/leia/script.watchlist/$PKG_SECTION.$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python2 module.simplejson"
PKG_LONGDESC="CoreELEC-settings: is a settings dialog for CoreELEC"
PKG_TOOLCHAIN="manual"



unpack() {
  mkdir -p $PKG_BUILD/addon
  #tar --strip-components=1 -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/addon
	unzip -qq $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.zip -d $PKG_BUILD/addon
	cp -R $PKG_BUILD/addon/$PKG_SECTION.$PKG_NAME/* $PKG_BUILD/addon
	rm -rf $PKG_BUILD/addon/$PKG_SECTION.$PKG_NAME
}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
  cp -rP $PKG_BUILD/addon/* $INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}
}