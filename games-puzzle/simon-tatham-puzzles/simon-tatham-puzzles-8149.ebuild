# Copyright 1999-2006 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit games toolchain-funcs

DESCRIPTION="Simon Tatham's Portable Puzzle Collection contains more than 20 one-player puzzle games"
HOMEPAGE="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
SRC_URI="http://www.chiark.greenend.org.uk/~sgtatham/puzzles/puzzles-r${PV}.tar.gz"

#There is a LICENCE file inside the tarball
LICENSE=""
SLOT="0"
KEYWORDS="~x86"
IUSE=""

# This package should compile with GTK 2 or GTK 1.2. Read the Makefile.
# This ebuild, however, requires GTK 2.
RDEPEND=">=x11-libs/gtk+-2.0"
DEPEND="${RDEPEND}
	dev-util/pkgconfig"

S="${WORKDIR}/puzzles-r${PV}"

src_compile() {
	# Make the Makefile use the user's CC and CFLAGS
	sed -i "
		s:^\(CC *=\).*:\1 $(tc-getCC): ;
		s:^\(CFLAGS *=\)[^\`]*:\1 ${CFLAGS} :" Makefile || die "sed patching failed"
	emake prefix=/usr || die "emake failed"
}

src_install() {
	dodir "${GAMES_BINDIR}"
	make DESTDIR="${D}" gamesdir="${GAMES_BINDIR}" install || die "Install failed!"
	dodoc HACKING README puzzles.txt puzzles.hlp
	prepgamesdirs
}
