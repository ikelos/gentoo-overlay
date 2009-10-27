# Copyright 1999-2007 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/x11-drivers/xf86-video-ati/xf86-video-ati-6.6.192.ebuild,v 1.1 2007/05/21 05:25:33 dberkholz Exp $

EAPI=2

inherit x-modular

DESCRIPTION="Driver for Wacom tablets and drawing devices"
KEYWORDS="~amd64 ~x86"
EGIT_REPO_URI="git://anongit.freedesktop.org/~whot/xf86-input-wacom"
SRC_URI=""
IUSE=""

RDEPEND=">=x11-base/xorg-server-1.6"
DEPEND="${RDEPEND}
	x11-proto/inputproto
	x11-proto/xproto"
