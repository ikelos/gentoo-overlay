# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git distutils

DESCRIPTION="Compizconfig Settings Manager"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/compizconfig/ccsm"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="
	>=dev-python/compizconfig-python-${PV}
	>=dev-python/pygtk-2.12
	dev-python/sexy-python
	gnome-base/librsvg
"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_compile() {
	distutils_src_compile --prefix=/usr
}

src_install() {
	distutils_src_install --prefix=/usr
}
