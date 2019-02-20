# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="kodi-theme-Ghost"
PKG_VERSION="11bece16a6713d1541caaff913c1eadddd6aaf67"
PKG_LICENSE="GPL"
PKG_SITE="http://159.89.43.103/tvstream/skin.ghost"
PKG_URL="http://159.89.43.103/tvstream/skin.ghost/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET=""
PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_LONGDESC="Kodi Mediacenter default theme."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
	echo $TARGET_NAME
	cp -a $(get_build_dir kodi)/../$PKG_NAME-$PKG_VERSION $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.ghost
  mkdir -p $INSTALL/usr/share/kodi/storage_addons
  cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.ghost $INSTALL/usr/share/kodi/storage_addons

}
