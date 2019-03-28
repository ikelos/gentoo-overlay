# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 gnome-meson meson

DESCRIPTION="GNOME Remote Desktop screen share service"
HOMEPAGE="https://gitlab.gnome.org/jadahl/gnome-remote-desktop"
SRC_URI=""
EGIT_REPO_URI="https://gitlab.gnome.org/jadahl/gnome-remote-desktop"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="net-libs/libvncserver
		>=media-video/pipewire-0.2.5"
RDEPEND="${DEPEND}"

src_install () {
	meson_src_install
}
