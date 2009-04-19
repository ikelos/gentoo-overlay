# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2

DESCRIPTION="An alarm clock applet for Gnome"
HOMEPAGE="http://alarm-clock.pseudoberries.com/"
SRC_URI="http://launchpad.net/${PN}/trunk/0.2/+download/${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
dev-libs/dbus-glib
gnome-base/gconf
gnome-base/gnome-panel
gnome-base/orbit
media-libs/gstreamer
sys-apps/dbus
x11-libs/gtk+
x11-libs/libnotify
"
RDEPEND="${DEPEND}"

