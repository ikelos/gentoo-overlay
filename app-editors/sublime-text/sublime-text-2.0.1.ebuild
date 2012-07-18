# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="4"

# needed by make_desktop_entry
inherit eutils gnome2-utils

MY_PN="Sublime%20Text"
MY_P="${MY_PN}%20${PV}"
S="${WORKDIR}/Sublime Text 2"

DESCRIPTION="Sublime Text is a sophisticated text editor for code, html and prose"
HOMEPAGE="http://www.sublimetext.com"
COMMON_URI="http://c758482.r82.cf2.rackcdn.com"
SRC_URI="amd64? ( ${COMMON_URI}/${MY_P}.tar.bz2 )
	x86? ( ${COMMON_URI}/${MY_P}.tar.bz2 )"
LICENSE="Sublime"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
RESTRICT="mirror"

RDEPEND="media-libs/libpng:1.2
	>=x11-libs/gtk+-2.24.8-r1:2"

src_install() {
	insinto /opt/${PN}
	exeinto /opt/${PN}
	doins -r "lib"
	doins -r "Pristine Packages"
	
	doins -r "Icon"
	doins "sublime_plugin.py"
	doins "PackageSetup.py"
	doexe "sublime_text"
	dosym "/opt/${PN}/sublime_text" /usr/bin/sublime
	
	insinto "/usr/share/icons/hicolor"
	for i in 16 32 48 128 256;
	do
		doicon -s ${i} "Icon/${i}x${i}"
	done
	make_desktop_entry "sublime %U" "Sublime Text Editor" "sublime_text" "Application;TextEditor" "MimeType=text/plain;"
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}

pkg_postrm() {
	gnome2_icon_cache_update
}
