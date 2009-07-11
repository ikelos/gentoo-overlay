# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit autotools versionator eutils games

MY_P="snes9x-$(get_version_component_range 1-2)"
MY_V="$(get_version_component_range 3)"

DESCRIPTION="GTK port of Super Nintendo Entertainment System (SNES) emulator"
HOMEPAGE="http://snes9x-gtk.googlecode.com/"
SRC_URI="http://snes9x-gtk.googlecode.com/files/${MY_P}-src-gtk-${MY_V}.tar.bz2"

LICENSE="as-is GPL-2 LGPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug dga joystick zlib"

RDEPEND="x11-libs/libXext
   >=x11-libs/gtk+-2.8
   =media-libs/portaudio-19*   
   dev-libs/libxml2
   media-libs/libpng   
   dga? ( x11-libs/libXxf86dga
      x11-libs/libXxf86vm )
   virtual/opengl
   virtual/glu
   x11-libs/gtkglext
   joystick? ( media-libs/libsdl )"
DEPEND="${RDEPEND}
   x86? ( dev-lang/nasm )
   x11-proto/xextproto
   x11-proto/xproto
   dga? ( x11-proto/xf86dgaproto
      x11-proto/xf86vidmodeproto )"

S=${WORKDIR}/${MY_P}-src/gtk

src_compile() {
	egamesconf \
		--with-opengl \
		$(use_with x86 assembler) \
		$(use_with joystick) \
		$(use_with debug debugger) \
		$(use_with zlib) \
		$(use_with dga extensions)
	emake || die "make failed"
}

src_install() {
	emake install DESTDIR="${D}" || die "make install failed"
	
	#dogamesbin snes9x-gtk || die "dogamesbin failed"
	dodoc README
	prepgamesdirs
} 
