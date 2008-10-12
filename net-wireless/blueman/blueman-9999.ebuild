# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils subversion

ESVN_REPO_URI="svn://svn.tuxfamily.org/svnroot/blueman/svn/trunk"

DESCRIPTION="Bluetooth Manager for Gnome"
HOMEPAGE="http://blueman.tuxfamily.org/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE=""

DEPEND="dev-python/notify-python
		dev-python/pybluez
		|| ( >=net-wireless/bluez-utils-3 >=net-wireless/bluez-libs-4 )
		net-wireless/gnome-bluetooth
		gnome-extra/gnome-vfs-obexftp
		dev-python/dbus-python
		dev-python/pyrex
		"
RDEPEND="${DEPEND}"

