# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python3_3 python3_4 python3_5 python3_6 )
inherit distutils-r1

DESCRIPTION="Typed Abstract Syntax Tree forked from python 2.7/3.5 ast"
HOMEPAGE="https://github.com/python/typed_ast"
SRC_URI="https://github.com/python/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="PYTHON Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
