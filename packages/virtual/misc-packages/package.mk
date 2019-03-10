# SPDX-License-Identifier: GPL-3.0-or-later
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)
# Copyright (C) 2018-present Team CoreELEC (https://coreelec.org)

PKG_NAME="misc-packages"
PKG_VERSION=""
PKG_LICENSE="GPL"
PKG_SITE="https://libreelec.tv"
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain Python3 $ADDITIONAL_PACKAGES"
PKG_SECTION="virtual"
PKG_LONGDESC="misc-packages: Metapackage for miscellaneous packages"

post_install() {

			mkdir -p $INSTALL/usr/lib/coreelec
			cp -PR $PKG_DIR/scripts/* $INSTALL/usr/lib/coreelec

			enable_service storage-addons-copy.service

			#ADDON_MANIFEST=$INSTALL/usr/share/kodi/system/addon-manifest.xml
		  #xmlstarlet ed -L --subnode "/addons" -t elem -n "addon" -v "skin.ghost" $ADDON_MANIFEST
	}
