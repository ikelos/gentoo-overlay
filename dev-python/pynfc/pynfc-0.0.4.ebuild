# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils

DESCRIPTION="Python bindings for the libnfc library"
HOMEPAGE="http://pynfc.googlecode.com/"
SRC_URI="http://pynfc.googlecode.com/files/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=dev-libs/libnfc-1.3.1
		>=dev-lang/swig-2.0.0"
RDEPEND="${DEPEND}"
