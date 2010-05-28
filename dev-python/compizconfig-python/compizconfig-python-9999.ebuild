# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git distutils

DESCRIPTION="Compizconfig Python Bindings"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/compizconfig/compizconfig-python"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="
	>=dev-libs/glib-2.6
	dev-python/pyrex
	dev-python/cython
	>=x11-libs/libcompizconfig-${PV}
"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install --prefix=/usr
}
