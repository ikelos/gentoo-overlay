# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
anyhow-1.0.59
tracing-0.1.36
tracing-subscriber-0.3.15
once_cell-1.9.0
gettext-rs-0.7.0
gtk-0.6.6
gdk-wayland-0.6.3
gdk-x11-0.6.3
adw-0.4.0
gst_video-0.20.4
gst_pbutils-0.20.5
gst-0.20.0
gst-plugin-gif-0.10.0
gst-plugin-gtk4-0.10.5
futures-channel-0.3.19
futures-util-0.3
gsettings-macro-0.1.15
pulse-2.26.0
pulse_glib-2.25.1
"

inherit meson cargo git-r3 xdg-utils gnome2-utils

DESCRIPTION=""
HOMEPAGE=""
SRC_URI=""
EGIT_REPO_URI="https://github.com/SeaDve/Kooha"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

PATCHES=("${FILESDIR}/${PN}-build.patch")

src_unpack() {
	git-r3_src_unpack
	cargo_live_src_unpack
}

src_configure() {
	cargo_gen_config
	cargo_src_configure --frozen
	cat ${WORKDIR}/cargo_home/config
	meson_src_configure
	cp -r ${WORKDIR}/cargo_home ${BUILD_DIR}
}

src_compile() {
	meson_src_compile
}

src_install() {
	meson_src_install
}

pkg_postint() {
	gnome2_schemas_update
	xdg_icon_cache_update
}

pkg_postrm() {
	gnome2_schemas_update
	xdg_icon_cache_update
}
