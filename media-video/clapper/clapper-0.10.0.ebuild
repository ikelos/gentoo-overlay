# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson xdg-utils gnome2-utils

DESCRIPTION="A GNOME media player built using GJS with GTK4 toolkit"
HOMEPAGE="https://github.com/Rafostar/clapper"
SRC_URI="https://github.com/Rafostar/clapper/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=media-libs/gstreamer-1.18
		>=gui-libs/libadwaita-1.0.0
		dev-libs/libpeas:2"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	gnome2_schemas_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_mimeinfo_database_update
	xdg_icon_cache_update
	xdg_desktop_database_update
}

