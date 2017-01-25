# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=6

if [ "${PV}" == "9999" ]; then
inherit git-r3

SRC_URI=""
EGIT_REPO_URI="https://github.com/${PN/_/-}/${PN}.git"
else
SRC_URI="https://github.com/${PN/_/-}/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="BBC Iplayer downloading application"
HOMEPAGE="http://linuxcentre.net/get_iplayer/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="|| ( media-video/mplayer
              media-video/mpv )
		virtual/ffmpeg
		media-sound/lame
		media-video/flvstreamer
		media-video/rtmpdump
		dev-perl/libwww-perl
		dev-perl/XML-Simple
		dev-perl/XML-LibXML
		"
DEPEND=""

src_install() {
	dobin ${PN}
	doman ${PN}.1
	dodoc "README.md" "CHANGELOG.md" "CONTRIBUTORS"
}
