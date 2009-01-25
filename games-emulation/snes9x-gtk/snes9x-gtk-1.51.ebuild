# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools eutils games

MY_P="snes9x-${PV}"
MY_V="52"

DESCRIPTION="GTK port of Super Nintendo Entertainment System (SNES) emulator"
HOMEPAGE="http://www.snes9x.com/phpbb2/viewtopic.php?t=3703"
SRC_URI="http://bearoso.googlepages.com/snes9x-${PV}-src-gtk-${MY_V}.tar.bz2"

LICENSE="as-is GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug dga joystick opengl zlib"

RDEPEND="x11-libs/libXext
   >=x11-libs/gtk+-2.8
   =media-libs/portaudio-19*   
   dev-libs/libxml2
   media-libs/libpng   
   dga? ( x11-libs/libXxf86dga
      x11-libs/libXxf86vm )
   opengl? ( virtual/opengl
      virtual/glu
      x11-libs/gtkglext )
   joystick? ( media-libs/libsdl )"
DEPEND="${RDEPEND}
   x86? ( dev-lang/nasm )
   x11-proto/xextproto
   x11-proto/xproto
   dga? ( x11-proto/xf86dgaproto
      x11-proto/xf86vidmodeproto )"

S=${WORKDIR}/${MY_P}-src

src_unpack() {
	unpack ${A}
	cd "${S}"
	sed -i \
		-e 's:-lXext -lX11::' Makefile.in \
		|| die "sed failed"
	epatch \
		"${FILESDIR}"/${MY_P}-build.patch \
		"${FILESDIR}"/${MY_P}-config.patch
		# "${FILESDIR}"/${MY_P}-opengl.patch \
		# "${FILESDIR}"/${MY_P}-x11.patch
	eautoconf
}

src_compile() {
	egamesconf \
		--with-gtk \
		$(use_with opengl) \
		$(use_with x86 assembler) \
		$(use_with joystick) \
		$(use_with debug debugger) \
		$(use_with zlib) \
		$(use_with dga extensions)
	emake || die "make failed"
}

src_install() {
	dogamesbin snes9x-gtk || die "dogamesbin failed"
	dodoc gtk/README doc/* unix/docs/*
	prepgamesdirs
} 
