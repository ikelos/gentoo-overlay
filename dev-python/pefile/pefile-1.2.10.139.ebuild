# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="3"
PYTHON_COMPAT=( python2_7 )

inherit versionator distutils eutils

MY_PV=$(replace_version_separator 3 '-')
MY_P=${PN}-${MY_PV}

DESCRIPTION="PE File analysis module"
HOMEPAGE="https://github.com/erocarrera/pefile"
SRC_URI="https://github.com/erocarrera/pefile/archive/pefile-1.2.10-139.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-lang/python"
RDEPEND="dev-lang/python"

S=${WORKDIR}/${PN}-${MY_P}

src_prepare() {
	default_src_prepare
	sed -i -e "s/__revision__\[21:-2\]/$(get_version_component_range 4)/" "pefile.py"
}

