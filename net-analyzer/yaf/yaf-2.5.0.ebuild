# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Yet Another Flowsensor turns packets into NETFIX"
HOMEPAGE=""
SRC_URI="https://tools.netsa.cert.org/releases/${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-libs/glib
dev-libs/libfixbuf
dev-libs/libpcre
net-libs/libpcap
sys-apps/dbus
sys-devel/libtool"
RDEPEND="${DEPEND}"
