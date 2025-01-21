# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

LLVM_COMPAT=( {15..19} )

inherit cmake llvm-r1 toolchain-funcs flag-o-matic xdg-utils

DESCRIPTION="A hex editor for reverse engineers, programmers, and eyesight"
HOMEPAGE="https://github.com/WerWolv/ImHex"
SRC_URI="
	https://github.com/WerWolv/ImHex/releases/download/v${PV}/Full.Sources.tar.gz -> ${P}.gh.tar.gz
	https://github.com/WerWolv/ImHex-Patterns/archive/refs/tags/ImHex-v${PV}.tar.gz -> ${PN}-patterns-${PV}.gh.tar.gz
"
S="${WORKDIR}/ImHex"
S_PATTERNS="${WORKDIR}/ImHex-Patterns-ImHex-v${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE="+system-llvm test lto +desktop-portal"
RESTRICT="!test? ( test )"

PATCHES=(
	# If virtual/dotnet-sdk is installed on your system, then cmake
	# will use it at some point and try to access internet.
	# Because it did not cause any issue, we can disable it
	"${FILESDIR}/remove_dotnet.patch"
	# Remove the different -Werror flags
	"${FILESDIR}/remove_Werror.patch"
	# The mbedTLS package is housed under mbedtls3 rather than mbedtls
	"${FILESDIR}/patch_mbedtls3_cmake_package.patch"
)

DEPEND="
	app-arch/bzip2
	app-arch/xz-utils
	app-arch/zstd:=
	app-forensics/yara:=
	>=dev-cpp/nlohmann_json-3.10.2
	dev-libs/capstone:=
	>=dev-libs/nativefiledialog-extended-1.2.1[desktop-portal?]
	>=dev-libs/libfmt-8.0.0:=
	media-libs/fontconfig
	media-libs/freetype
	>=media-libs/glfw-3.4[X]
	media-libs/glm
	media-libs/libglvnd
	net-libs/mbedtls:=
	net-misc/curl
	sys-apps/file
	sys-libs/zlib
	virtual/libiconv
	virtual/libintl
"
RDEPEND="${DEPEND}"
BDEPEND="
	system-llvm? ( llvm-core/llvm )
	app-admin/chrpath
	gnome-base/librsvg
"

pkg_pretend() {
	if tc-is-gcc && [[ $(gcc-major-version) -lt 14 ]]; then
		die "${PN} requires GCC 14 or newer"
	fi
}

src_unpack() {
	default

	mv "${S_PATTERNS}" "${S}/ImHex-Patterns"
}

src_configure() {
	# Building ImHex with -Werror=strict-aliasing gives a failed build
	# for tests/algorithms/source/endian.cpp, and ImHex usually has pretty
	# clean build (without warnings), so it should be safe to do
	filter-flags -Werror=strict-aliasing

	if use test; then
		sed -ie "s/tests EXCLUDE_FROM_ALL/tests ALL/" "${S}/CMakeLists.txt"
	fi

	local mycmakeargs=(
		-D IMHEX_PLUGINS_IN_SHARE=OFF \
		-D IMHEX_STRIP_RELEASE=OFF \
		-D IMHEX_OFFLINE_BUILD=ON \
		-D IMHEX_IGNORE_BAD_CLONE=ON \
		-D IMHEX_PATTERNS_PULL_MASTER=OFF \
		-D IMHEX_IGNORE_BAD_COMPILER=OFF \
		-D IMHEX_USE_GTK_FILE_PICKER=$(usex !desktop-portal) \
		-D IMHEX_DISABLE_STACKTRACE=OFF \
		-D IMHEX_BUNDLE_DOTNET=OFF \
		-D IMHEX_ENABLE_LTO=$(usex lto) \
		-D IMHEX_USE_DEFAULT_BUILD_SETTINGS=OFF \
		-D IMHEX_STRICT_WARNINGS=OFF \
		-D IMHEX_STATIC_LINK_PLUGINS=OFF \
		-D IMHEX_ENABLE_UNITY_BUILD=OFF \
		-D IMHEX_ENABLE_STD_ASSERTS=OFF \
		-D IMHEX_ENABLE_UNIT_TESTS=$(usex test) \
		-D IMHEX_ENABLE_PRECOMPILED_HEADERS=OFF \
		-D IMHEX_COMPRESS_DEBUG_INFO=OFF \
		-D IMHEX_VERSION="${PV}" \
		-D PROJECT_VERSION="${PV}" \
		-D USE_SYSTEM_CAPSTONE=ON \
		-D USE_SYSTEM_FMT=ON \
		-D USE_SYSTEM_LLVM=$(usex system-llvm) \
		-D USE_SYSTEM_NFD=ON \
		-D USE_SYSTEM_NLOHMANN_JSON=ON \
		-D USE_SYSTEM_YARA=ON \
	)

	cmake_src_configure
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
}
