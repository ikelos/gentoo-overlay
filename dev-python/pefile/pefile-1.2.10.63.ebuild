# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator distutils eutils

MY_PV=$(replace_version_separator 3 '-')
MY_P=${PN}-${MY_PV}


DESCRIPTION="PE File analysis module"
HOMEPAGE="http://dkbza.org/pefile.html"
SRC_URI="http://${PN}.googlecode.com/files/${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"

S=${WORKDIR}/${MY_P}

