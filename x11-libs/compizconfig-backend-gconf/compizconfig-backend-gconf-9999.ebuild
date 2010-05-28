# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cmake-utils git

DESCRIPTION="Compizconfig Gconf Backend"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/compizconfig/compizconfig-backend-gconf"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

DEPEND="
	>=gnome-base/gconf-2.0
	>=x11-libs/libcompizconfig-${PV}
	>=x11-wm/compiz-${PV}
"
RDEPEND="${DEPEND}"

src_configure() {
	unset CMAKE_BUILD_TYPE
	cmake-utils_src_configure
}
