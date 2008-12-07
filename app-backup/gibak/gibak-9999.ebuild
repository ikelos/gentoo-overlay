# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit git

EGIT_REPO_URI="http://eigenclass.org/repos/git/gibak/.git"

DESCRIPTION="Git-based Backup Tool"
HOMEPAGE="http://eigenclass.org/hiki/gibak-0.3.0"
SRC_URI=""

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="xattr"

DEPEND="${RDEPEND}
		dev-util/omake
		dev-lang/ocaml"
RDEPEND="dev-util/git"

src_compile() {
	# Nasty hack, since omake seems to open_wr files that it only reads
	cp -r /usr/lib/omake ${S}
	use xattr && CFLAGS="${CFLAGS} -DHAVE_LINUX_XATTR"
	OMAKEPATH=${S}/omake omake || die "Omake failed"
}

src_install() {
	# Install ml-compiled programs
	local installables="find-git-files find-git-repos ometastore"
	for i in ${installables};
	do
		newbin ${i}.opt ${i}
	done

	dobin gibak
	dodoc README.txt
}

