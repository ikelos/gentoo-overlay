# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils gnome2

DESCRIPTION="Gnome main menu"
HOMEPAGE=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=">=net-misc/networkmanager-0.7.0"
RDEPEND="${DEPEND}"

src_unpack() {
	gnome2_src_unpack
	epatch ${FILESDIR}/g-m-m-build-nm.patch
}
