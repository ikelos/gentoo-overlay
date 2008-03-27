# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="D-bus based GPS daemon"
HOMEPAGE="http://gypsy.freedesktop.org/"
SRC_URI="http://gypsy.freedesktop.org/gypsy-releases/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="-*"
IUSE="bluetooth"

CDEPEND="dev-libs/glib
		sys-apps/dbus
		bluetooth? ( net-wireless/bluez-libs )"
DEPEND="${CDEPEND}"
RDEPEND="${CDEPEND}"

src_compile() {
	econf $(use_enable bluetooth) || "Failed to configure."
	emake || die "Failed to compile."
}

src_install() {
	emake install DESTDIR=${D} || die "Failed to install."
}


