# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit distutils versionator

DIR_PV=$(get_version_component_range 1-2)
EXT_PV=$(get_version_component_range 1-3)

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="http://launchpad.net/${PN}/${DIR_PV}/${EXT_PV}/+download/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="dev-python/python-distutils-extra
		${RDEPEND}"

