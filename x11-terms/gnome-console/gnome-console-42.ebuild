# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
inherit gnome.org gnome2-utils meson xdg

DESCRIPTION="A terminal emulator for GNOME"
HOMEPAGE="https://apps.gnome.org/app/org.gnome.Console/ https://gitlab.gnome.org/GNOME/console"

SRC_URI="https://gitlab.gnome.org/GNOME/console/-/archive/${PV}.beta/console-${PV}.beta.tar.gz"
S="${WORKDIR}/console-${PV}.beta"

LICENSE="GPL-3+"
SLOT="0"
IUSE="debug +nautilus"

KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~ia64 ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86 ~amd64-linux ~x86-linux"

RDEPEND="
>=gui-libs/libhandy-1.5.0
>=x11-libs/vte-0.67.0
>=gnome-base/libgtop-2.40.0-r1
>=gnome-base/gsettings-desktop-schemas-41.0
nautilus? ( >=gnome-base/nautilus-41.2 )
"
DEPEND="${RDEPEND}"
BDEPEND="
>=dev-lang/sassc-3.6.2
"

src_configure() {
	local emesonargs=(
		-Dsassc=disabled
		$(meson_use debug devel)
		$(meson_feature nautilus nautilus)
	)
	meson_src_configure
}

src_install() {
	meson_src_install
}

pkg_postinst() {
	xdg_pkg_postinst
	gnome2_schemas_update
}

pkg_postrm() {
	xdg_pkg_postrm
	gnome2_schemas_update
}
