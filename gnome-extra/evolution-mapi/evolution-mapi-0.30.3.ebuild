# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/evolution-exchange/evolution-exchange-2.28.2.ebuild,v 1.1 2010/01/11 21:49:00 eva Exp $

EAPI="2"

inherit autotools eutils gnome2

DESCRIPTION="Evolution module for connecting to Microsoft Exchange"
HOMEPAGE="http://www.novell.com/products/desktop/features/evolution.html"
LICENSE="GPL-2"

SLOT="2.0"
KEYWORDS="-amd64 -x86"
IUSE="debug doc static"

RDEPEND="
	>=mail-client/evolution-${PV}
	>=gnome-extra/evolution-data-server-${PV}[kerberos]
	>=dev-libs/glib-2.16.0
	>=x11-libs/gtk+-2.10
	>=gnome-base/gconf-2.0
	>=gnome-base/libbonobo-2.20.3
	>=gnome-base/libglade-2.0
	>=gnome-base/libgnomeui-2.0
	dev-libs/libxml2
	net-libs/libsoup:2.4
	>=net-nds/openldap-2.1.30-r2
	net-libs/libmapi"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.40
	dev-util/pkgconfig
	dev-util/gtk-doc-am
	doc? ( >=dev-util/gtk-doc-1 )"

DOCS="AUTHORS ChangeLog NEWS README"

