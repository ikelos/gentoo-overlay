# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator gnome2

MY_SHORTPV="$(get_version_component_range 1-2)"

DESCRIPTION="Event tracking daemon"
HOMEPAGE="http://zeitgeist-project.com/"
SRC_URI="http://code.launchpad.net/${PN}/${MY_SHORTPV}/${MY_SHORTPV}/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="${RDEPEND}"
RDEPEND="dev-lang/python
		 sys-apps/dbus"

#### TODO:
#
# Fix installation of .pyc/.pyo files!!!
#


