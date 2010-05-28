# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

EGIT_HAS_SUBMODULES=true

inherit eutils gnome2-utils cmake-utils git

DESCRIPTION="Compiz Fusion Window Decorator Plugins"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/plugins-extra"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="gnome debug"

RDEPEND="
	>=gnome-base/librsvg-2.14.0
	media-libs/jpeg
	x11-libs/cairo
	>=x11-wm/compiz-${PV}[gnome?]
"

DEPEND="${RDEPEND}
	>=dev-util/intltool-0.35
	>=dev-util/pkgconfig-0.19
	>=sys-devel/gettext-0.15
"

src_configure() {
	mycmakeargs="${mycmakeargs}
		-DCOMPIZ_INSTALL_GCONF_SCHEMA_DIR=/etc/gconf/schemas
		-DCOMPIZ_PLUGIN_INSTALL_TYPE=compiz"

	if use debug; then
		CMAKE_BUILD_TYPE=Debug
	else
		unset CMAKE_BUILD_TYPE
	fi

	cmake-utils_src_configure
}

pkg_preinst() {
	use gnome && gnome2_gconf_savelist
}

pkg_postinst() {
	use gnome && gnome2_gconf_install
}
