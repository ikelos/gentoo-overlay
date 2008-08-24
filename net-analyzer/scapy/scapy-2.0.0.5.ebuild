# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/scapy/scapy-1.1.1-r1.ebuild,v 1.3 2008/05/01 14:31:00 maekke Exp $

inherit distutils

MY_OFFSET="`expr 47 + ${#P}`"

DESCRIPTION="A Python interactive packet manipulation program for mastering the network"
HOMEPAGE="http://www.secdev.org/projects/scapy/"
SRC_URI="http://www.secdev.org/projects/scapy/files/${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="gnuplot pyx crypt graphviz imagemagick visual"

DEPEND="virtual/python
		app-arch/unzip
		sys-apps/coreutils"
RDEPEND="net-analyzer/tcpdump
	gnuplot? ( dev-python/gnuplot-py )
	pyx? ( dev-python/pyx )
	crypt? ( dev-python/pycrypto )
	graphviz? ( media-gfx/graphviz )
	imagemagick? ( media-gfx/imagemagick )
	visual? ( dev-python/visual )"

src_unpack() {
	# Nasty hack, but otherwise it's going to barf on the bad zip files
	dd if="${DISTDIR}/${A}" of="${WORKDIR}/${A}" bs=1 skip="${MY_OFFSET}"
	cd "${WORKDIR}"
	unpack "./${A}"

	cd "${S}"
	epatch "${FILESDIR}/${PV}-no-docs.patch"
}

