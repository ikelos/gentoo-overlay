# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome2 meson xdg

DESCRIPTION=""
HOMEPAGE="https://gitlab.gnome.org/GNOME/showtime"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-plugins/gst-plugin-gtk4"
RDEPEND="${DEPEND}"
BDEPEND="dev-util/blueprint-compiler"

pkg_postint() {
	gnome2_schemas_update
	gnome2_pkg_postinst
}

pkg_postrm() {
	gnome2_schemas_update
	gnome2_pkg_postrm
}
