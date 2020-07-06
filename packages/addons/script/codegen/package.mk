# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="codegen"
PKG_VERSION="4f9ef20d46bffec4b03bb6f200e8e679a555e917"
#PKG_SHA256="33edd6ba4d7b52b9f3eb810311fc468689aac8c412358dc8e66c85876aecab5b"
PKG_LICENSE="GPL"
PKG_SECTION="script"
PKG_SITE="https://gitlab.com/tvstream-iptv"
PKG_URL="https://gitlab.com/tvstream-iptv/script.codegen/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain module.requests"
PKG_LONGDESC="CoreELEC-settings: is a settings dialog for CoreELEC"
PKG_TOOLCHAIN="manual"


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
