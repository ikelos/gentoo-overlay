# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit git-2 python-single-r1

DESCRIPTION="Mail nagger for gnome-shell (port of popper for unity)"
HOMEPAGE="http://launchpad.net/mailnag"
SRC_URI=""

EGIT_REPO_URI="http://github.com/pulb/mailnag.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="dev-python/pygobject:3
		dev-python/gnome-keyring-python
		${PYTHON_DEPS}"
RDEPEND="${DEPEND}"

src_prepare() {
	cd "${S}"
	"${S}/gen_locales"

	sed -i -e 's|LIB_DIR=./Mailnag|LIB_DIR=/usr/share/mailnag/Mailnag|' -e 's|^python |python2.7 |' "${PN}"*
}

src_install() {
	dodir "/usr/share/${PN}"
	cp -r "${S}"/* "${D}/usr/share/${PN}/"

	dosym "/usr/share/${PN}/${PN}" "/usr/bin/${PN}"
	dosym "/usr/share/${PN}/${PN}_config" "/usr/bin/${PN}_config"
}
