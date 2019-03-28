# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 gnome-meson meson

DESCRIPTION="GNOME Remote Desktop screen share service"
HOMEPAGE="https://github.com/benzea/gnome-screencast"
SRC_URI=""
EGIT_REPO_URI="https://github.com/benzea/gnome-screencast"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="media-libs/gst-rtsp-server"
RDEPEND="${DEPEND}"

src_install () {
	meson_src_install
}
