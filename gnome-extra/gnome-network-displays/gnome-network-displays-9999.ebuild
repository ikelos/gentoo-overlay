# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit gnome.org git-r3 meson xdg

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://gitlab.gnome.org/GNOME/gnome-network-displays.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND="media-libs/gst-rtsp-server"
RDEPEND="${DEPEND}"
BDEPEND=""

pkg_postinst() {
	xdg_icon_cache_update
}

pkg_postrm() {
	xdg_icon_cache_update
}

