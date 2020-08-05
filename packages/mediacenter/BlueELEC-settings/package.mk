# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="BlueELEC-settings"
PKG_VERSION="c8d0fb49a1fa28a5516da7341a17693aa40803d9"
#PKG_SHA256="33edd6ba4d7b52b9f3eb810311fc468689aac8c412358dc8e66c85876aecab5b"
PKG_LICENSE="GPL"
PKG_SITE="https://coreelec.org"
PKG_URL="https://gitlab.com/tvstream-iptv/service.blueelec.settings/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python2 connman pygobject dbus-python"
PKG_LONGDESC="BlueELEC-settings: is a settings dialog for BluerobotELEC"

PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

if [ "$DISPLAYSERVER" = "x11" ]; then
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET setxkbmap"
else
  PKG_DEPENDS_TARGET="$PKG_DEPENDS_TARGET bkeymaps"
fi

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/coreelec
    cp $PKG_DIR/scripts/* $INSTALL/usr/lib/coreelec

  ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/service.blueelec.settings

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/resources/lib/ -f
  #rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

  $TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/oe.py -f
  #rm -rf $ADDON_INSTALL_DIR/oe.py
}

post_install() {
  enable_service backup-restore.service
  enable_service factory-reset.service
}