# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
VALA_MIN_API_VERSION="0.26"
VALA_USE_DEPEND="vapigen"

inherit gnome2 meson vala xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://gitlab.com/posidon_software/paper/-/archive/${PV}/${P}.tar.bz2"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="$(vala_depend)
		dev-util/blueprint-compiler
		gnome-base/gsettings-desktop-schemas"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	vala_setup
	default
}

src_configure() {
	meson_src_configure
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
