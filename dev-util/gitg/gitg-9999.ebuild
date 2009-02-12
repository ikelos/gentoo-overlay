# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit gnome2 git

DESCRIPTION="git repository viewer for GNOME"
HOMEPAGE="http://wiki.github.com/jessevdk/gitg"
SRC_URI=""

EGIT_REPO_URI="git://git.gnome.org/gitg"
EGIT_BOOTSTRAP="NOCONFIGURE=1 ./autogen.sh"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-libs/glib-2.16
	>=x11-libs/gtk+-2.12
	>=x11-libs/gtksourceview-2.2
	>=gnome-base/gconf-2.10
	dev-util/git"

DEPEND="${RDEPEND}
	gnome-base/gnome-common
	sys-devel/gettext
	>=dev-util/pkgconfig-0.15
	>=dev-util/intltool-0.35"

pkg_postinst() {
	ewarn "This version of gitg is an unstable development snapshot."
	ewarn "Please report any problems at http://trac.novowork.com/gitg ."
}
