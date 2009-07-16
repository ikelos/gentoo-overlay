# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit autotools subversion

ESVN_REPO_URI="http://neatx.googlecode.com/svn/tags/neatx/${P}/"

DESCRIPTION="Google implementation of NX server"
HOMEPAGE="http://code.google.com/p/neatx/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND=""

S=${WORKDIR}/${PN}

src_prepare() {
	sed -i -e "s/rst2html]/rst2html.py]/" ${S}/configure.ac
	eautoreconf
}

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}

#### TODO
#
# Sort out .pyo/.pyc installation
#

