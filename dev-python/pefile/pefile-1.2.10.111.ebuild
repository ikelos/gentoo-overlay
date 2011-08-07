# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_DEPEND="2:2.5"

inherit versionator distutils eutils

MY_PV=$(replace_version_separator 3 '-')
MY_P=${PN}-${MY_PV}

DESCRIPTION="PE File analysis module"
HOMEPAGE="http://code.google.com/p/pefile/"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"

S=${WORKDIR}/${MY_P}

