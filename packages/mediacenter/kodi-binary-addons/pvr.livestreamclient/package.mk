# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="pvr.livestreamclient"
PKG_VERSION="5f4dce0b4aa5c96cee27372480b3a21d26911ca9"
# PKG_SHA256="a6b47e0ae2b15ab8070640d1dd98a3d940a3882b6d8b6e43097086de20df5648"
PKG_REV="3"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="http://www.kodi.tv"
PKG_URL="https://gitlab.com/tvstream-iptv/pvr.livestreamclient/-/archive/master/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain kodi-platform rapidxml zlib"
PKG_SECTION=""
PKG_SHORTDESC="pvr.livestreamclient"
PKG_LONGDESC="pvr.livestreamclient"

PKG_IS_ADDON="yes"
PKG_ADDON_TYPE="xbmc.pvrclient"

PKG_CMAKE_OPTS_TARGET="-DRAPIDXML_INCLUDE_DIRS=$(get_build_dir rapidxml)"