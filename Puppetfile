# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "mysql",           "1.0.1"
github "sysctl",          "1.0.0"
github "redis",           "1.0.0"
github "pkgconfig",       "1.0.0"
github "imagemagick",     "1.2.0"
github "phantomjs",       "1.0.0"
github "textmate",        "1.1.0", :repo => "AquaGeek/puppet-textmate2"
github "sublime_text_2",  "1.1.0", :repo => "boxen/puppet-sublime_text_2"
github "jumpcut",         "1.0.0"
github "imageoptim",      "0.0.2", :repo => "webflo/puppet-imageoptim"
github "gitx",            "1.2.0"
github "git_tower",       "1.0.0", :repo => "kevinSuttle/puppet-git_tower"
github "firefox",         "1.0.5"
github "chrome",          "1.1.0"
github "caffeine",        "1.0.0"
github "postgresapp",     "1.0.0", :repo => "lixef/puppet-postgresapp"
github "pdftk",           "1.1.0", :repo => "concordia-publishing-house/puppet-pdftk"
github "automake",        "1.0.1", :repo => "burke/puppet-automake"
github "libtool",         "1.0.0"
github "iterm2",          "1.0.2", :repo => "boxen/puppet-iterm2"
github "mdbtools",        "1.0.0", :repo => "concordia-publishing-house/puppet-mdbtools"
github "pow",             "1.0.0"
github "heroku",          "2.0.0"
github "s3cmd",           "1.0.1", :repo => "KendallPark/puppet-s3cmd"
