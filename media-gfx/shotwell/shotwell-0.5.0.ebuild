# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator gnome2

DESCRIPTION="Open source photo manager for GNOME"
HOMEPAGE="http://www.yorba.org/shotwell"
SRC_URI="http://www.yorba.org/download/${PN}/$(get_version_component_range 1-2)/${P}.tar.bz2"

LICENSE="LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/vala
		dev-libs/libgee
		media-libs/libgphoto2
		dev-libs/libunique"
RDEPEND="${DEPEND}"

src_install() {
	gnome2_src_install DISABLE_DESKTOP_UPDATE="1" DISABLE_SCHEMAS_INSTALL="1" DISABLE_ICON_UPDATE="1"
}

