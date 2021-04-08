# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

PYTHON_COMPAT=( python3_{7,8,9} )

inherit distutils-r1

DESCRIPTION="010 template library for python"
HOMEPAGE="https://github.com/d0c-s4vage/py010parser/"
SRC_URI="https://github.com/d0c-s4vage/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="mit"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-python/six-1.10.0
		<dev-python/six-2.0.0
		>dev-python/regex-2019.0.0"
RDEPEND="${DEPEND}"
