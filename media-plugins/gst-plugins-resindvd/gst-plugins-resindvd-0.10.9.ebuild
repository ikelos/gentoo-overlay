# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-plugins/gst-plugins-dvb/gst-plugins-dvb-0.10.9.ebuild,v 1.1 2008/12/05 22:39:10 ssuominen Exp $

inherit gst-plugins-bad

DESCRIPION="Plugin for full dvdnav capabilities"
KEYWORDS="-x86"
IUSE=""

RDEPEND=">=media-libs/gst-plugins-base-0.10.21"
DEPEND="${RDEPEND}
	>=media-libs/libdvdnav-0.1.7
	virtual/os-headers
	dev-util/pkgconfig"

GST_PLUGINS_BUILD="experimental dvdnav resindvd"
