# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..13} )
RUST_MIN_VER="1.82.0"

CRATES="
	aho-corasick@1.1.3
	anes@0.1.6
	anstream@0.6.20
	anstyle-parse@0.2.7
	anstyle-query@1.1.4
	anstyle-wincon@3.0.10
	anstyle@1.0.11
	anyhow@1.0.99
	autocfg@1.5.0
	base64ct@1.8.0
	bitflags@1.3.2
	bitflags@2.9.3
	block-buffer@0.10.4
	bumpalo@3.19.0
	cast@0.3.0
	cfg-if@1.0.3
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clap@4.5.46
	clap_builder@4.5.46
	clap_derive@4.5.45
	clap_lex@0.7.5
	colorchoice@1.0.4
	colored@3.0.0
	console@0.15.11
	const-oid@0.9.6
	const-random-macro@0.1.16
	const-random@0.1.18
	cpufeatures@0.2.17
	criterion-plot@0.6.0
	criterion@0.7.0
	crossbeam-channel@0.5.15
	crossbeam-deque@0.8.6
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.21
	crunchy@0.2.4
	crypto-common@0.1.6
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.3
	der@0.7.10
	deranged@0.4.0
	digest@0.10.7
	dirs-sys@0.5.0
	dirs@6.0.0
	dlv-list@0.5.2
	ed25519-dalek@2.2.0
	ed25519@2.2.3
	either@1.15.0
	encode_unicode@1.0.0
	env_home@0.1.0
	equivalent@1.0.2
	errno@0.3.13
	fiat-crypto@0.2.9
	fluent-uri@0.1.4
	fnv@1.0.7
	fsevent-sys@4.1.0
	futures-channel@0.3.31
	futures-core@0.3.31
	futures-executor@0.3.31
	futures-io@0.3.31
	futures-sink@0.3.31
	futures-task@0.3.31
	futures-util@0.3.31
	futures@0.3.31
	generic-array@0.14.7
	getrandom@0.2.16
	glob@0.3.3
	half@2.6.0
	hashbrown@0.14.5
	hashbrown@0.15.5
	heck@0.5.0
	indexmap@2.11.0
	inotify-sys@0.1.5
	inotify@0.11.0
	insta@1.43.1
	is_terminal_polyfill@1.70.1
	itertools@0.13.0
	itoa@1.0.15
	js-sys@0.3.77
	kqueue-sys@1.0.4
	kqueue@1.1.1
	lazy_static@1.5.0
	libc@0.2.175
	libredox@0.1.9
	linux-raw-sys@0.9.4
	lock_api@0.4.13
	log@0.4.27
	lsp-server@0.7.9
	lsp-types@0.97.0
	memchr@2.7.5
	mio@1.0.4
	notify-types@2.0.0
	notify@8.2.0
	nu-ansi-term@0.46.0
	num-conv@0.1.0
	num-traits@0.2.19
	num_threads@0.1.7
	once_cell@1.21.3
	once_cell_polyfill@1.70.1
	oorandom@11.1.5
	option-ext@0.2.0
	ordered-multimap@0.7.3
	overload@0.1.1
	parking_lot@0.12.4
	parking_lot_core@0.9.11
	pin-project-lite@0.2.16
	pin-utils@0.1.0
	pkcs8@0.10.2
	plotters-backend@0.3.7
	plotters-svg@0.3.7
	plotters@0.3.7
	powerfmt@0.2.0
	proc-macro2@1.0.101
	quote@1.0.40
	rand_core@0.6.4
	rayon-core@1.13.0
	rayon@1.11.0
	redox_syscall@0.5.17
	redox_users@0.5.2
	regex-automata@0.4.10
	regex-syntax@0.8.6
	regex@1.11.2
	rust-ini@0.21.3
	rustc_version@0.4.1
	rustix@1.0.8
	rustversion@1.0.22
	ryu@1.0.20
	same-file@1.0.6
	scc@2.4.0
	scopeguard@1.2.0
	sdd@3.0.10
	semver@1.0.26
	serde@1.0.219
	serde_derive@1.0.219
	serde_json@1.0.143
	serde_repr@0.1.20
	serial_test@3.2.0
	serial_test_derive@3.2.0
	sha2@0.10.9
	sharded-slab@0.1.7
	shellexpand@3.1.1
	shlex@1.3.0
	signature@2.2.0
	similar@2.7.0
	slab@0.4.11
	smallvec@1.15.1
	spki@0.7.3
	strsim@0.11.1
	subtle@2.6.1
	syn@2.0.106
	thiserror-impl@1.0.69
	thiserror-impl@2.0.16
	thiserror@1.0.69
	thiserror@2.0.16
	thread_local@1.1.9
	time-core@0.1.4
	time-macros@0.2.22
	time@0.3.41
	tiny-keccak@2.0.2
	tinytemplate@1.2.1
	toml_datetime@0.7.0
	toml_edit@0.23.4
	toml_parser@1.0.2
	toml_writer@1.0.2
	tracing-appender@0.2.3
	tracing-attributes@0.1.30
	tracing-core@0.1.34
	tracing-log@0.2.0
	tracing-subscriber@0.3.19
	tracing@0.1.41
	trim-in-place@0.1.7
	typenum@1.18.0
	unicode-ident@1.0.18
	urlencoding@2.1.3
	utf8parse@0.2.2
	valuable@0.1.1
	version_check@0.9.5
	walkdir@2.5.0
	wasi@0.11.1+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.100
	wasm-bindgen-macro-support@0.2.100
	wasm-bindgen-macro@0.2.100
	wasm-bindgen-shared@0.2.100
	wasm-bindgen@0.2.100
	web-sys@0.3.77
	which@8.0.0
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.10
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-link@0.1.3
	windows-sys@0.59.0
	windows-sys@0.60.2
	windows-targets@0.52.6
	windows-targets@0.53.3
	windows_aarch64_gnullvm@0.52.6
	windows_aarch64_gnullvm@0.53.0
	windows_aarch64_msvc@0.52.6
	windows_aarch64_msvc@0.53.0
	windows_i686_gnu@0.52.6
	windows_i686_gnu@0.53.0
	windows_i686_gnullvm@0.52.6
	windows_i686_gnullvm@0.53.0
	windows_i686_msvc@0.52.6
	windows_i686_msvc@0.53.0
	windows_x86_64_gnu@0.52.6
	windows_x86_64_gnu@0.53.0
	windows_x86_64_gnullvm@0.52.6
	windows_x86_64_gnullvm@0.53.0
	windows_x86_64_msvc@0.52.6
	windows_x86_64_msvc@0.53.0
	winnow@0.7.13
	winsafe@0.0.19
	zeroize@1.8.1
"

declare -A GIT_CRATES=(
	[rust-ini]='https://github.com/davidhalter-archive/rust-ini;ae7f2cd0782bb6df1c943e022538c274ac0cdaad;rust-ini-%commit%'
)

inherit git-r3 cargo distutils-r1

DESCRIPTION="Python language server written in rust"
HOMEPAGE="https://github.com/zubanls/zuban/"
SRC_URI="
	${CARGO_CRATE_URIS}
"
#	https://github.com/zubanls/${PN}/archive/refs/tags/v${PV}.tar.gz

EGIT_REPO_URI="https://github.com/zubanls/zuban/"
EGIT_COMMIT="v${PV}"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	|| ( dev-lang/rust dev-lang/rust-bin )
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

S="${WORKDIR}/${P}/deploy/pypi/zuban"

src_unpack() {
	cargo_src_unpack
	git-r3_src_unpack
	default_src_unpack
}

src_prepare() {
	sed -i -e 's/locked = .*/# locked = False/' "${WORKDIR}/${P}/deploy/pypi/zuban/pyproject.toml"
	default_src_prepare
	cp "${FILESDIR}/licenses.html" "${S}"
}

