# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="Library for reading RAW image formats"
HOMEPAGE="http://www.libraw.org/"
SRC_URI="http://www.libraw.org/data/LibRaw-${PV/_b/-B}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S="${WORKDIR}/LibRaw-${PV/_b/-B}"

src_install() {
	dolib lib/*.a

	insinto /usr/include/libraw
	doins libraw/*
}

