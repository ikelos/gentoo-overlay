# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2-utils python git

EGIT_REPO_URI="git://github.com/nzjrs/facebook-notify"

DESCRIPTION="Facebook notification tool"
HOMEPAGE="http://nzjrs.github.com/facebook-notify/"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygtk
		dev-python/pywebkitgtk"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_install() {
	python_version
	dodir /usr/lib/python${PYVER}/site-packages/
	cp -r facebook ${D}/usr/lib/python${PYVER}/site-packages
	exeinto /usr/share/${PN}
	insinto /usr/share/${PN}
	doexe facebook-notify.py
	dodir /usr/share/
	cp -r icons ${D}/usr/share/
	dosym /usr/share/${PN}/facebook-notify.py /usr/bin/facebook-notify
}

pkg_preinst() {
	gnome2_icon_savelist
}

pkg_postinst() {
	gnome2_icon_cache_update
}
