# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python3_{7,8,9} )
inherit distutils-r1

DESCRIPTION="Pysmb is a SMB/CIFS library written in Python to support file sharing"
HOMEPAGE="https://miketeo.net/projects/pysmb"
SRC_URI="https://github.com/miketeo/${PN}/archive/rel-${PV//./-}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/${PN}-rel-${PV//./-}"
