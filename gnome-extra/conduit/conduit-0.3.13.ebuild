# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="0"

inherit eutils versionator

DESCRIPTION="Synchronization for GNOME"
HOMEPAGE="http://www.conduit-project.org"
SRC_URI="http://ftp.gnome.org/pub/GNOME/sources/conduit/$(get_version_component_range 1-2)/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86"
IUSE="nautilus eog"

DEPEND=">=dev-python/pygoocanvas-0.9.0
		>=dev-python/vobject-0.4.8
		>=dev-python/pyxml-0.8.4
		>=dev-python/pygtk-2.10.3
		>=dev-python/pysqlite-2.3.1"
RDEPEND=">=dev-python/pygoocanvas-0.9.0"

src_unpack() {
	unpack "${A}"

	epatch "${FILESDIR}/${P}_correct_firefox_path.patch"
}

src_compile() {
	econf \
		$(use_enable nautilus nautilus-extension) \
		$(use_enable eog eog-plugin) \
		|| die "configure failed"

	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "Error installing ${PN}"
}
