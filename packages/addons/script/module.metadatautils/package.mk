# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="module.metadatautils"
PKG_VERSION="1.0.0"
#PKG_SHA256="33edd6ba4d7b52b9f3eb810311fc468689aac8c412358dc8e66c85876aecab5b"
PKG_LICENSE="GPL"
PKG_SECTION="script"
PKG_SITE="https://coreelec.org"
PKG_URL="https://mirrors.kodi.tv/addons/leia/script.module.metadatautils/$PKG_SECTION.$PKG_NAME-$PKG_VERSION.zip"
PKG_DEPENDS_TARGET="toolchain Python2 module.requests module.beautifulsoup module.thetvdb module.musicbrainz module.arrow module.simplecache"
PKG_LONGDESC="CoreELEC-settings: is a settings dialog for CoreELEC"
PKG_TOOLCHAIN="manual"

#PKG_MAKE_OPTS_TARGET="DISTRONAME=$DISTRONAME ROOT_PASSWORD=$ROOT_PASSWORD"

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

post_makeinstall_target() {


	ADDON_INSTALL_DIR=$INSTALL/usr/share/kodi/addons/${PKG_SECTION}.${PKG_NAME}

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/lib/helpers/ -f
	#rm -rf $(find $ADDON_INSTALL_DIR/resources/lib/ -name "*.py")

	$TOOLCHAIN/bin/python -Wi -t -B $TOOLCHAIN/lib/$PKG_PYTHON_VERSION/compileall.py $ADDON_INSTALL_DIR/lib/metadatautils.py -f
	#rm -rf $ADDON_INSTALL_DIR/oe.py
}
