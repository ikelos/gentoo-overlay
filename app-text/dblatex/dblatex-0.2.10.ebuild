# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

inherit distutils eutils

DESCRIPTION="Transform DocBook using TeX macros"
SRC_URI="mirror://sourceforge/${PN}/${P}.tar.bz2"
HOMEPAGE="http://dblatex.sourceforge.net/"

KEYWORDS="~x86 ~amd64"
IUSE=""
SLOT="0"
LICENSE="GPL-2"
DEPEND="|| ( ( app-text/texlive
			   dev-texlive/texlive-latexextra
			   dev-texlive/texlive-pictures
			   dev-texlive/texlive-mathextra
			   dev-texlive/texlive-xetex
			 )
			 >=app-text/texlive-3
		   )
		 !<app-text/tex4ht-20090611_p1038-r1"

src_unpack() {
	distutils_src_unpack
	epatch "${FILESDIR}/labelid.xsl.patch"
}

