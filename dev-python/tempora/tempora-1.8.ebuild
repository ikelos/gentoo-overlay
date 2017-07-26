# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_7,3_3,3_4,3_6} pypy pypy3 )

inherit distutils-r1

DESCRIPTION="Objects and routines pertaining to date and time (tempora)"
HOMEPAGE="https://pypi.python.org/pypi/tempora"
SRC_URI="mirror://pypi/t/${PN}/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~ia64 ~ppc ~x86 ~amd64-linux ~x86-linux ~x64-macos ~x86-macos"
IUSE="test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
		dev-python/pytz
		dev-python/six"
RDEPEND=""
