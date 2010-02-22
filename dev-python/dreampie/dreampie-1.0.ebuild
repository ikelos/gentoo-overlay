# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils versionator

MY_SHORT_PV=$(get_version_component_range 1-2)

DESCRIPTION="Interactive GUI/Shell for python with autocompletion"
HOMEPAGE="http://dreampie.sourceforge.net/"
SRC_URI="http://launchpad.net/${PN}/trunk/${MY_SHORT_PV}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python
		>=dev-python/pygtk-2.16.0
		>=dev-python/pygtksourceview-2.8.0"
RDEPEND="${DEPEND}"

