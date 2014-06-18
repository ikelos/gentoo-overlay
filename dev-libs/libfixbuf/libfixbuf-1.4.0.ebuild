# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="IPFIX library"
HOMEPAGE="http://tools.netsa.cert.org/"
SRC_URI="https://tools.netsa.cert.org/releases/${P}.tar.gz"

LICENSE="LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib
		dev-libs/openssl"
RDEPEND="${DEPEND}"
