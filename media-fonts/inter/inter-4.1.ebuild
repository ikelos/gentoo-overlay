# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit font

DESCRIPTION="Inter font"
HOMEPAGE="https://rsms.me/inter/"
SRC_URI=""https://github.com/rsms/inter/releases/download/v${PV}/Inter-${PV}.zip

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
S="${WORKDIR}"

FONT_SUFFIX="ttf ttc"

