# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit distutils

DESCRIPTION="Python interface for libnids"
HOMEPAGE="http://jon.oberheide.org/pynids/"
SRC_URI="http://jon.oberheide.org/${PN}/downloads/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="net-libs/libnids"
RDEPEND="${DEPEND}"

