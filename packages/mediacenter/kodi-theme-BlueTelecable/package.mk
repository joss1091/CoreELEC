# SPDX-License-Identifier: GPL-2.0-or-later

PKG_NAME="kodi-theme-BlueTelecable"
PKG_VERSION="9f1f2ca20cb68bacff16401b47c8541b0158c7a6"
PKG_LICENSE="GPL"
PKG_SITE="https://gitlab.com/tvstream-iptv/skin.blue.telecable"
PKG_URL="https://gitlab.com/tvstream-iptv/skin.blue.telecable/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="autocompletion embuary.helper"
PKG_NEED_UNPACK="$(get_pkg_directory $MEDIACENTER)"
PKG_LONGDESC="Kodi Mediacenter  theme."
PKG_TOOLCHAIN="manual"

# makeinstall_target() {
# 	echo $TARGET_NAME
# 	cp -a $(get_build_dir kodi)/../$PKG_NAME-$PKG_VERSION $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.ghost
#   mkdir -p $INSTALL/usr/share/kodi/storage_addons
#   cp -a $(get_build_dir kodi)/.$TARGET_NAME/addons/skin.ghost $INSTALL/usr/share/kodi/storage_addons
#
# }
unpack() {
  mkdir -p $PKG_BUILD/addon
  tar --strip-components=1 -xf $SOURCES/$PKG_NAME/$PKG_NAME-$PKG_VERSION.tar.gz -C $PKG_BUILD/addon
}

make_target() {
  :
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/share/kodi/storage_addons/skin.blue.telecable
  cp -rP $PKG_BUILD/addon/* $INSTALL/usr/share/kodi/storage_addons/skin.blue.telecable
}

post_makeinstall_target() {


  ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
  #rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/__init__.py -f
  #rm -rf $ADDON_INSTALL_DIR/oe.py
}
