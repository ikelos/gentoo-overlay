# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python{2_6,2_7,3_1,3_2,3_3,3_4} )

inherit distutils-r1

DESCRIPTION="Library for implementing RPC/SOAP in python"
HOMEPAGE="http://spyne.io/"
SRC_URI="https://pypi.python.org/packages/source/s/${PN}/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
