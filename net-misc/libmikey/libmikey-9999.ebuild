# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-misc/libmutil/Attic/libmutil-0.3.0.ebuild,v 1.1.1.1 2005/11/30 09:54:35 chriswhite Exp $

EAPI="4"

inherit autotools subversion

IUSE=""
DESCRIPTION="Minisip keying support library"
HOMEPAGE="http://www.minisip.org/"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND=">=dev-libs/openssl-0.9.6d
		~net-misc/libmutil-9999"

ESVN_REPO_URI="svn://svn.minisip.org/minisip/trunk/${PN}"


src_prepare() {
	epatch "${FILESDIR}/mikey-sakke.patch"
	eautoreconf
}
