# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils git-r3 autotools

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/Yubico/yubikey-personalization.git"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="sys-auth/libyubikey"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}/yubikey-ar.patch"
	eautoreconf
}

src_configure() {
	econf --disable-static || die "Failed"
}

