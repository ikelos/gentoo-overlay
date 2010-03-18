# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/giggle/giggle-0.4.ebuild,v 1.1 2008/01/27 07:59:19 compnerd Exp $

EAPI="1"

inherit autotools gnome2 git

# EGIT_REPO_URI="git://github.com/hasselmm/giggle.git"
EGIT_REPO_URI="git://github.com/guyou/giggle.git"
EGIT_BRANCH="fixes"
EGIT_TREE="fixes"

DESCRIPTION="GTK+ Frontend for GIT"
HOMEPAGE="http://live.gnome.org/giggle"
SRC_URI=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~ppc ~x86"
IUSE="eds"

RDEPEND=">=dev-vcs/git-1.4.4.3
		 >=dev-libs/glib-2.18
		 >=x11-libs/gtk+-2.10
		 >=x11-libs/gtksourceview-2.8
		 eds? ( gnome-extra/evolution-data-server )
		 >=gnome-base/libglade-2.4"
DEPEND="${RDEPEND}
		  sys-devel/gettext
		>=dev-util/pkgconfig-0.15
		>=dev-util/intltool-0.35"

S="${WORKDIR}/${PN}"

DOCS="AUTHORS NEWS README"

G2CONF="$(use_enable eds evolution-data-server)"

src_unpack() {
	git_src_unpack
	cd ${S}
	eautoreconf
	intltoolize -f
}
