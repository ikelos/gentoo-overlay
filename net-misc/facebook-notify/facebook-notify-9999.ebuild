# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit python git

EGIT_REPO_URI="git://github.com/nzjrs/facebook-notify"

DESCRIPTION="Facebook notification tool"
HOMEPAGE="http://nzjrs.github.com/facebook-notify/"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="dev-python/pygtk
		dev-python/pywebkitgtk"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
	sed -i -e "s!os.path.join(os.path.dirname(__file__),'facebook.png')!'/usr/share/facebook-notify/facebook.png'!"	facebook-notify.py
}

src_install() {
	python_version
	dodir /usr/lib/python${PYVER}/site-packages/
	cp -r facebook ${D}/usr/lib/python${PYVER}/site-packages
	exeinto /usr/share/${PN}
	insinto /usr/share/${PN}
	doexe facebook-notify.py
	doins facebook.png
	dosym /usr/share/${PN}/facebook-notify.py /usr/bin/facebook-notify
}
