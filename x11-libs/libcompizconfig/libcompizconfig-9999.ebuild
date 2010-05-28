# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit gnome2-utils cmake-utils git

DESCRIPTION="Compiz Configuration System (git)"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/compizconfig/libcompizconfig"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="gnome debug"

RDEPEND="
	dev-libs/libxml2
	>=x11-wm/compiz-${PV}
"
DEPEND="${RDEPEND}
	>=dev-util/intltool-0.41
	>=dev-util/pkgconfig-0.19
"

RESTRICT="test"

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

src_install() {
	cmake-utils_src_install
	mkdir -p "${D}/usr/share/cmake/Modules/"
	cp "${S}/cmake/FindCompizConfig.cmake" "${D}/usr/share/cmake/Modules/"
}

pkg_preinst() {
	use gnome && gnome2_gconf_savelist
}

pkg_postinst() {
	use gnome && gnome2_gconf_install
}
