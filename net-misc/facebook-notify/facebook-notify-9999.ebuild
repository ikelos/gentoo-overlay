# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit distutils git eutils

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

src_prepare() {
	cd ${S}
	sed -i -e 's/libfacebooknotify"/libfacebooknotify","libfacebooknotify.facebook"/' setup.py
}
