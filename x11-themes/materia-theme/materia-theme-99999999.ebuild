# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit meson

DESCRIPTION="A Material Design-like flat theme for GTK3, GTK2 and GNOME Shell"
HOMEPAGE="https://github.com/nana-4/materia-theme"

if [[ ${PV} == 99999999 ]];then
	inherit git-r3
	EGIT_REPO_URI="${HOMEPAGE}"
	KEYWORDS="~amd64 ~x86"
else
	SRC_URI="${HOMEPAGE}/archive/v${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"

DEPEND="
	x11-libs/gtk+:2
	>=x11-libs/gtk+-3.18:3
	x11-themes/gtk-engines-murrine
	x11-libs/gdk-pixbuf"
RDEPEND="${DEPEND}"
BDEPEND="
	dev-util/dart-sass
	media-gfx/inkscape
	media-gfx/optipng"

