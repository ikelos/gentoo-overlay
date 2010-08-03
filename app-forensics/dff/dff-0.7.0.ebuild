# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit cmake-utils

DESCRIPTION="A digital forensics framework which aims to analyze and recover any
kind of digital artifact."
HOMEPAGE="http://tracker.digital-forensic.org/"
SRC_URI="http://tracker.digital-forensic.org/attachments/fetch/137/${P}-src.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="phonon"

DEPEND=">=dev-lang/swig-1.3.38
		>=dev-lang/python-2.5
		<=dev-lang/python-3
		dev-python/sip
		>=dev-python/PyQt4-4.4.0[phonon?]
		>=dev-python/qscintilla-python-2.4
		>=sys-apps/file-4.26[python]
		"
RDEPEND="${DEPEND}"

S="${WORKDIR}/${P}-src"

src_configure() {
	mycmakeargs+=( "-DINSTALL:BOOLEAN=ON" )
	cmake-utils_src_configure
}

