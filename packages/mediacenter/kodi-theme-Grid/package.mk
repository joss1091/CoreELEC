# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="kodi-theme-Grid"
PKG_VERSION="e20b663c4893bd81cc29de97e5565b36b54e4305"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://github.com/jeroenpardon/skin.grid/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_LONGDESC="Kodi Mediacenter default theme."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	cp -a $(get_build_dir kodi)/../$PKG_NAME-$PKG_VERSION $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.grid
  mkdir -p $INSTALL/usr/share/kodi/storage_addons
  cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.grid $INSTALL/usr/share/kodi/storage_addons

}
