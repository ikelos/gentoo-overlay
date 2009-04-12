# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

DESCRIPTION="Gnome Graphics Tablet Applications"
HOMEPAGE="http://www.alexmac.cc/tablet-apps/"
SRC_URI="http://www.alexmac.cc/${PN}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

RDEPEND="dev-python/pygtk
		dev-python/gnome-python-desktop"
DEPEND=""

src_unpack() {
	unpack ${A}
	cd ${S}
	rm Makefile
	sed -i -e "s|/usr/share/[^/]\+/|/usr/share/${PN}/|g" *
	sed -i -e "s|\.py||" *
}

src_compile() {
	einfo "Compilation not needed"
}

src_install() {
	insinto /usr/share/${PN}
	doins input-tablet* tablet-capplet.glade
	
	insinto /usr/lib/bonobo/servers
	doins *.server
	
	insinto /usr/share/applications
	doins tablet-capplet.desktop

	newbin tablet-capplet.py tablet-capplet
	newbin pressure-applet.py pressure-applet
}

