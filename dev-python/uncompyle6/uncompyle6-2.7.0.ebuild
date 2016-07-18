# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python3_4 python3_2 python3_3 python2_7 python3_5 )

inherit git-r3 distutils-r1

DESCRIPTION="A python byte-code decompiler"
HOMEPAGE="https://github.com/rocky/python-uncompyle6"
SRC_URI=""

EGIT_REPO_URI="http://github.com/rocky/python-uncompyle6.git"
EGIT_TAG="v${PN}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-python/nose"
RDEPEND="${DEPEND}"

