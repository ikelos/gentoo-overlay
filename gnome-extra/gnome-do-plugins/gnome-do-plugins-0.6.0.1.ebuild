# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/gnome-extra/gnome-do-plugins/gnome-do-plugins-0.4.0.ebuild,v 1.1 2008/03/22 12:30:17 graaff Exp $

inherit eutils autotools gnome2 mono versionator

MY_PN="do-plugins"
PVC=$(get_version_component_range 1-2)
PVC2=$(get_version_component_range 1-3)

DESCRIPTION="Plugins to put the Do in Gnome Do"
HOMEPAGE="http://do.davebsd.com/"
SRC_URI="https://launchpad.net/${MY_PN}/${PVC}/${PVC2}/+download/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="-amd64 -x86"
IUSE="amarok evo"

DEPEND=">=gnome-extra/gnome-do-${PV}
		evo? ( dev-dotnet/evolution-sharp )"
RDEPEND="${DEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}
	epatch ${FILESDIR}/${P}-disable-evo-flickr.patch
	eautoreconf
}

src_compile()
{
	econf \
		$(use_enable amarok amarok-plugin) \
		$(use_enable evo evolution-plugin) \
		|| die "configure failed"
	emake || die "make failed"
}
