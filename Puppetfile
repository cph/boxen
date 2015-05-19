# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.7.0"

# Support for default hiera data in modules

github "module_data", "0.0.3", :repo => "ripienaar/puppet-module-data"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.0.2"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"
github "nvm",        "1.0.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "mysql",          "1.0.1"
github "sysctl",         "1.0.0"
github "redis",          "1.0.0"
github "xquartz",        "1.1.0"
github "pkgconfig",      "1.0.0"
github "imagemagick",    "1.2.0"
github "phantomjs",      "1.0.0"
github "textmate",       "1.1.0", :repo => "AquaGeek/puppet-textmate2"
github "sublime_text_2", "1.1.0", :repo => "boxen/puppet-sublime_text_2"
github "jumpcut",        "1.0.0"
github "imageoptim",     "0.0.2", :repo => "webflo/puppet-imageoptim"
github "gitx",           "1.2.0"
github "tower",          "1.0.0"
github "firefox",        "1.0.5"
github "chrome",         "1.1.0"
github "caffeine",       "1.0.0"
github "postgresapp",    "1.0.0", :repo => "lixef/puppet-postgresapp"
github "repository",     "2.0.0"
github "pdftk",          "1.1.0", :repo => "concordia-publishing-house/puppet-pdftk"
github "autoconf",       "1.0.0"
github "automake",       "1.0.1", :repo => "burke/puppet-automake"
github "libtool",        "1.0.0"
github "iterm2",         "1.0.2", :repo => "boxen/puppet-iterm2"
github "mdbtools",       "1.0.0", :repo => "concordia-publishing-house/puppet-mdbtools"
github "pow",            "1.0.0"
github "heroku",         "2.0.0"
github "s3cmd",          "1.0.1", :repo => "KendallPark/puppet-s3cmd"
