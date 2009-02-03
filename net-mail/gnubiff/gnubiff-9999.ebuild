# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/net-mail/gnubiff/gnubiff-2.2.10.ebuild,v 1.3 2008/10/21 15:02:12 loki_val Exp $

inherit base autotools eutils cvs

ECVS_SERVER="gnubiff.cvs.sourceforge.net:/cvsroot/gnubiff"
ECVS_MODULE="gnubiff"

DESCRIPTION="A mail notification program"
HOMEPAGE="http://gnubiff.sourceforge.net/"
SRC_URI=""
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~ia64 ~x86"
IUSE="debug fam gnome nls password"

RDEPEND=">=x11-libs/gtk+-2.4
	>=gnome-base/libglade-2.3
	dev-libs/popt
	gnome? (
		>=gnome-base/libgnome-2.2
		>=gnome-base/libgnomeui-2.2 )
	password? ( dev-libs/openssl )
	fam? ( virtual/fam )
	x11-proto/xproto"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"
PATCHES=""

S="${WORKDIR}/${ECVS_MODULE}"

src_unpack() {
	cvs_src_unpack
	cd ${S}
	eautoreconf
}

src_compile() {
	econf $(use_enable debug) \
		$(use_enable gnome) \
		$(use_enable nls) \
		$(use_enable fam) \
		$(use_with password) \
		$(use_with password password-string ${RANDOM}${RANDOM}${RANDOM}${RANDOM}) \
		${myconf} || die "econf failed"
	emake || die "emake failed"
}

src_install() {
	make DESTDIR="${D}" install || die "make install failed"
	dodoc AUTHORS ChangeLog NEWS README THANKS TODO
}
