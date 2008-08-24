# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-analyzer/netspeed_applet/netspeed_applet-0.14.ebuild,v 1.1 2006/11/06 00:38:24 allanonjl Exp $

inherit eutils gnome2

DESCRIPTION="Applet showing network traffic for GNOME 2"
HOMEPAGE="http://mfcn.ilo.de/netspeed_applet/"
SRC_URI="http://www.wh-hms.uni-ulm.de/~mfcn/shared/netspeed/${P}.tar.gz"

SLOT="0"
IUSE=""
LICENSE="GPL-2"
KEYWORDS="~x86 ~ppc ~sparc ~amd64"

RDEPEND=">=gnome-base/libgnomeui-2.8
	>=gnome-base/gnome-panel-2
	>=gnome-base/libgtop-2.14.2"

DEPEND="${RDEPEND}
	dev-util/pkgconfig
	>=app-text/gnome-doc-utils-0.3.2
	>=dev-util/intltool-0.29"

DOCS="README NEWS ChangeLog COPYING AUTHORS INSTALL"

src_unpack() {
	gnome2_src_unpack

	epatch ${FILESDIR}/${P}-ifnames.patch
}
