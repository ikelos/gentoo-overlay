# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

DESCRIPTION="Bluetooth Manager for Gnome"
HOMEPAGE="http://blueman.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/${PN}/tarballs/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/notify-python
		dev-python/pybluez
		>=net-wireless/bluez-utils-3
		net-wireless/gnome-bluetooth
		gnome-extra/gnome-vfs-obexftp
		dev-python/dbus-python
		"
RDEPEND="${DEPEND}"

