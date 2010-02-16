# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"
USE_RUBY="ruby18"

# Depends on jeweler which we don't have yet.
RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_TASK_TEST="-f tasks/spec.rake spec"

inherit ruby-fakegem

DESCRIPTION="Support library for DataMapper and Merb"
HOMEPAGE="http://extlib.rubyforge.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_bdepend test ">=dev-ruby/json-1.2.0
	>=dev-ruby/rspec-1.2.9
	>=dev-ruby/yard-0.4.0"

each_ruby_prepare() {
	sed -i '/check_dependencies/d' tasks/spec.rake || die "Unable to remove check_dependencies rules."
}
