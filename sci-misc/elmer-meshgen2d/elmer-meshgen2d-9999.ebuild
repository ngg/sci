# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

AUTOTOOLS_AUTORECONF=true

inherit autotools-utils subversion

ELMER_ROOT="elmerfem"
MY_PN=${PN/elmer-/}

DESCRIPTION="Finite element programs, libraries, and visualization tools - meshgen2d"
HOMEPAGE="http://www.csc.fi/english/pages/elmer"
SRC_URI=""
ESVN_REPO_URI="https://elmerfem.svn.sourceforge.net/svnroot/elmerfem/trunk/${MY_PN}"
ESVN_PROJECT="${MY_PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="debug"

S="${WORKDIR}/meshgen2d"

PATCHES=(
	"${FILESDIR}"/${PN}-6.0_p4651-oof.patch
)

src_prepare() {
	subversion_src_prepare
	autotools-utils_src_prepare
}

src_configure() {
	local myeconfargs=(
		$(use_with debug)
	)
	autotools-utils_src_configure
}
