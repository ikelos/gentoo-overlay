# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils gnome2-utils cmake-utils git

DESCRIPTION="OpenGL window and compositing manager"
HOMEPAGE="http://www.compiz.org/"
EGIT_REPO_URI="git://git.compiz.org/compiz/core"

LICENSE="GPL-2 LGPL-2.1 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE="+cairo dbus fuse gnome gtk kde +svg debug"

COMMONDEPEND="
	dev-libs/glib:2
	dev-libs/libxml2
	dev-libs/libxslt
	media-libs/libpng
	>=media-libs/mesa-6.5.1-r1
	>=x11-base/xorg-server-1.1.1-r1
	x11-libs/libX11[xcb]
	x11-libs/libxcb
	x11-libs/libXcomposite
	x11-libs/libXdamage
	x11-libs/libXinerama
	x11-libs/libXrandr
	x11-libs/libICE
	x11-libs/libSM
	>=x11-libs/libXrender-0.8.4
	>=x11-libs/startup-notification-0.7
	cairo? (
		x11-libs/cairo[X]
	)
	dbus? ( >=sys-apps/dbus-1.0 )
	fuse? ( sys-fs/fuse )
	gnome? (
		>=gnome-base/gnome-control-center-2.16.1:2
		gnome-base/gnome-desktop
		gnome-base/gconf:2
	)
	gtk? (
		>=x11-libs/gtk+-2.8.0:2
		>=x11-libs/libwnck-2.18.3
		x11-libs/pango
	)
	kde? (
		|| (
			>=kde-base/kwin-4.2.0
			kde-base/kwin:live
		)
	)
	svg? (
		>=gnome-base/librsvg-2.14.0:2
		>=x11-libs/cairo-1.0
	)
"

DEPEND="${COMMONDEPEND}
	dev-util/pkgconfig
	x11-proto/damageproto
	x11-proto/xineramaproto
"

RDEPEND="${COMMONDEPEND}
	x11-apps/mesa-progs
	x11-apps/xvinfo
"

src_configure() {
	# Fix ACCESS VIOLATION
	epatch "${FILESDIR}/fix_access_violation.patch"

	mycmakeargs="${mycmakeargs}
		-DCOMPIZ_INSTALL_GCONF_SCHEMA_DIR=/etc/gconf/schemas
		$(cmake-utils_use gnome USE_GNOME)
		$(cmake-utils_use gnome USE_GNOME_KEYBINDINGS)
		$(cmake-utils_use gnome USE_GCONF)
		$(cmake-utils_use gnome USE_METACITY)
		$(cmake-utils_use gtk USE_GTK)
		$(cmake-utils_use kde USE_KDE4)"

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
	cp "${S}/cmake/FindCompiz.cmake" "${D}/usr/share/cmake/Modules/"
}

pkg_preinst() {
	use gnome && gnome2_gconf_savelist
}

pkg_postinst() {
	use gnome && gnome2_gconf_install
}
