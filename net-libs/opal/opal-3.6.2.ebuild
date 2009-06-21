# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit versionator eutils gnome2

DESCRIPTION="C++ class library normalising numerous telephony protocols"
HOMEPAGE="http://www.ekiga.org"

LICENSE="MPL-1.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~hppa ~ia64 ~ppc ~ppc64 ~sparc ~x86"
IUSE="debug doc java"

RDEPEND="~dev-libs/ptlib-2.$(get_version_component_range 2-3)
	>=media-video/ffmpeg-0.4.7
	media-libs/speex
	java? ( virtual/jdk )"

src_compile() {
	local makeopts

	# zrtp doesn't depend on net-libs/libzrtpcpp but on libzrtp from
	# http://zfoneproject.com/ that is not in portage
	econf \
		$(use_enable debug) \
		$(use_enable java) \
		--enable-plugins \
		--disable-localspeex \
		--disable-zrtp \
		|| die "econf failed"

	if use debug; then
		makeopts="debug"
	else
		makeopts="opt"
	fi

	emake ${makeopts} || die "emake failed"
}
