# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION=""
HOMEPAGE=""
SRC_URI="https://tools.netsa.cert.org/releases/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-libs/zlib
		net-libs/libpcap
		net-libs/gnutls
		dev-libs/lzo
		dev-libs/libgpg-error
		dev-libs/libgcrypt"
RDEPEND="${DEPEND}"
