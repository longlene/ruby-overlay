# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

USE_RUBY="ruby18 jruby ree18 ruby19"

RUBY_FAKEGEM_RECIPE_TEST="test"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.textile README.textile"

inherit ruby-fakegem

DESCRIPTION="Add Internationalization support to your Ruby application."
HOMEPAGE="http://rails-i18n.org/"

LICENSE="MIT"
SLOT="0.6"
KEYWORDS="~amd64 ~hppa ~ppc ~ppc64 ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos ~x86-macos ~sparc-solaris ~sparc64-solaris ~x64-solaris ~x86-solaris"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/mocha dev-ruby/test_declarative )"

each_ruby_test() {
	${RUBY} -w -Ilib -Itest test/all.rb
}

all_ruby_prepare() {
	#Bundler isn't really necessary here, and it doesn't work with jruby
	sed -i -e "15s/require 'bundler\/setup'//" test/test_helper.rb || die
}
