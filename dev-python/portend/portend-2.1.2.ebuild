# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_5,3_6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="TCP port monitoring utilities"
HOMEPAGE="https://pypi.python.org/pypi/portend"
SRC_URI="mirror://pypi/p/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		>=dev-python/tempora-1.8"
RDEPEND=""
