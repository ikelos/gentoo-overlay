# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit games subversion

DESCRIPTION="Open source implementation of the GrimEngine for Grim Fandango"
HOMEPAGE="http://residual.sourceforge.net/"
SRC_URI=""
ESVN_REPO_URI="http://residual.svn.sourceforge.net/svnroot/residual/residual/trunk"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-x86 -amd64"
IUSE=""

DEPEND="media-libs/libsdl
		media-libs/libvorbis
		media-libs/flac
		media-libs/libmad
		sys-libs/zlib"
RDEPEND="${DEPEND}"

src_configure() {
	cd "${S}"
	# Can't use econf because this configure doesn't understand --build
	./configure --prefix=/usr \
				--backend=sdl \
				--enable-release \
				--enable-all-engines
				#--enable-plugins \
				#--default-dynamic
	# Dynamic plugins don't link properly at the moment
}
