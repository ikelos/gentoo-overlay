# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit versionator

DIR_PV=$(get_version_component_range 1-2)
EXT_PV=$(get_version_component_range 1-3)

DESCRIPTION="A collection of plugins for other programs to provide information to Zeitgeist"
HOMEPAGE="http://launchpad.net/zeitgeist-datasources"
SRC_URI="http://launchpad.net/zeitgeist-datasources/${DIR_PV}/${EXT_PV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="+totem +firefox"

DEPEND=">=gnome-extra/zeitgeist-0.8.2
		sys-devel/libtool
		sys-devel/automake
		sys-devel/autoconf
		firefox? ( dev-libs/libzeitgeist
		  dev-libs/glib:2
		  net-libs/xulrunner:1.9 )
		totem? ( dev-lang/vala )"
RDEPEND="${DEPEND}"

src_install() {
	emake install DESTDIR="${D}" || die "Failed to install"
}

