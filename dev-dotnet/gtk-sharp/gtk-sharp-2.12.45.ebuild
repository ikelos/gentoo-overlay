# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit dotnet autotools mono-env

SLOT="2"
DESCRIPTION="gtk bindings for mono"
LICENSE="GPL-2"
HOMEPAGE="http://www.mono-project.com/GtkSharp"
KEYWORDS="~amd64 ~x86 ~ppc"
SRC_URI="http://download.mono-project.com/sources/gtk-sharp212/${P}.tar.gz"
IUSE="debug"

RESTRICT="test"

RDEPEND="
	>=dev-lang/mono-3.0
	x11-libs/pango
	>=dev-libs/glib-2.31
	dev-libs/atk
	x11-libs/gtk+:2
	gnome-base/libglade
	dev-perl/XML-LibXML
	!dev-dotnet/gtk-sharp-gapi
	!dev-dotnet/gtk-sharp-docs
	!dev-dotnet/gtk-dotnet-sharp
	!dev-dotnet/gdk-sharp
	!dev-dotnet/glib-sharp
	!dev-dotnet/glade-sharp
	!dev-dotnet/pango-sharp
	!dev-dotnet/atk-sharp"
DEPEND="${RDEPEND}
	virtual/pkgconfig
	sys-devel/automake:1.11"

src_prepare() {
	eapply "${FILESDIR}/${PN}-2.12.45-gtk-range-test.patch"
	# sed -i -e "s|-gacdir \$(DESTDIR)\$(prefix)/lib|-root \"${ED}/usr/$(get_libdir)\" -gacdir \"${ED}\/usr\/lib/\"|" ${S}/configure.in
	rm ${S}/configure
	eautoreconf
	default
}

src_configure() {
	econf	--disable-static \
		--disable-maintainer-mode \
		$(use_enable debug)
}

src_compile() {
	emake
}

src_install() {
	default
	dotnet_multilib_comply
	sed -i -e "s|{libdir}/mono/|{exec_prefix}/lib/mono/|g" "${D}/usr/lib64/pkgconfig/"*.pc
	for i in `find ${D}/usr/lib64/mono/`; do
		newgac="${i/\/usr\/lib64\/mono\///usr/lib/mono/}"
		mkdir -p $(dirname ${newgac})
		mv "${i}" "${i/\/usr\/lib64\/mono\///usr/lib/mono/}"
	done
	sed -i "s/\\r//g" "${D}"/usr/bin/* || die "sed failed"
}
